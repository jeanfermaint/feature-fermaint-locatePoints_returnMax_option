// Copyright (c) 2017-2021, Lawrence Livermore National Security, LLC and
// other Axom Project Developers. See the top-level COPYRIGHT file for details.
//
// SPDX-License-Identifier: (BSD-3-Clause)

#include "gtest/gtest.h"

#include <cstdlib>

#include <string>
#include <vector>
#include <memory>
#include <fstream>
#include <streambuf>

#include "axom/inlet/Inlet.hpp"
#include "axom/inlet/JSONSchemaWriter.hpp"
#include "axom/inlet/tests/inlet_test_utils.hpp"

using axom::inlet::Inlet;
using axom::inlet::JSONSchemaWriter;
using axom::sidre::DataStore;

bool hasSchemaUtility()
{
  const static bool hasUtility =
    std::system("/usr/bin/jsonschema --version") == 0;
  return hasUtility;
}

bool validateString(Inlet& inlet, const std::string& luaString)
{
  const static auto instanceFile = "test_input.json";
  const static auto schemaFile = "input_schema.json";

  std::ofstream jsonInstance(instanceFile);
  jsonInstance << axom::inlet::detail::fromLuaTo<axom::inlet::JSONReader>(
    luaString);
  jsonInstance.close();

  std::unique_ptr<JSONSchemaWriter> writer(new JSONSchemaWriter(schemaFile));
  inlet.registerWriter(std::move(writer));
  inlet.writeDoc();

  const std::string cmd =
    fmt::format("/usr/bin/jsonschema -i {0} {1}", instanceFile, schemaFile);
  return std::system(cmd.c_str()) == 0;
}

template <typename InletReader>
Inlet createBasicInlet(DataStore* ds, const std::string& luaString)
{
  std::unique_ptr<InletReader> reader(new InletReader());
  reader->parseString(axom::inlet::detail::fromLuaTo<InletReader>(luaString));
  const bool enableDocs = true;
  return Inlet(std::move(reader), ds->getRoot(), enableDocs);
}

template <typename InletReader>
class inlet_writer : public ::testing::Test
{
protected:
  void SetUp() override
  {
    if(!hasSchemaUtility())
    {
      GTEST_SKIP() << "jsonschema tool was not found";
    }
  }
};

TYPED_TEST_SUITE(inlet_writer, axom::inlet::detail::ReaderTypes);

TYPED_TEST(inlet_writer, top_level_bools)
{
  std::string testString = "foo = true; bar = false";
  DataStore ds;
  Inlet inlet = createBasicInlet<TypeParam>(&ds, testString);

  // Check for existing fields
  inlet.addBool("foo", "foo's description");
  inlet.addBool("bar", "bar's description");

  // Check one that doesn't exist and doesn't have a default value
  inlet.addBool("non/existant", "nothing");

  const bool jsonVerified = validateString(inlet, testString);

  EXPECT_TRUE(jsonVerified);
  EXPECT_EQ(inlet.verify(), jsonVerified);
}

TYPED_TEST(inlet_writer, top_level_bools_reqd)
{
  std::string testString = "foo = true";
  DataStore ds;
  Inlet inlet = createBasicInlet<TypeParam>(&ds, testString);

  // Check for existing fields
  inlet.addBool("foo", "foo's description");
  inlet.addBool("bar", "bar's description").required();

  // Check one that doesn't exist and doesn't have a default value
  inlet.addBool("non/existant", "nothing");

  const bool jsonVerified = validateString(inlet, testString);

  EXPECT_FALSE(jsonVerified);
  EXPECT_EQ(inlet.verify(), jsonVerified);
}

TYPED_TEST(inlet_writer, top_level_ints)
{
  std::string testString = "foo = 12; bar = 16";
  DataStore ds;
  Inlet inlet = createBasicInlet<TypeParam>(&ds, testString);

  inlet.addInt("foo", "foo's description");
  inlet.addInt("bar", "bar's description");

  const bool jsonVerified = validateString(inlet, testString);

  EXPECT_TRUE(jsonVerified);
  EXPECT_EQ(inlet.verify(), jsonVerified);
}

TYPED_TEST(inlet_writer, top_level_ints_wrong_type)
{
  std::string testString = "foo = 'first'; bar = 'second'";
  DataStore ds;
  Inlet inlet = createBasicInlet<TypeParam>(&ds, testString);

  // We specify the default as a "hint" to the JSONSchemaWriter
  // since expected type information is not stored explicitly in the datastore
  inlet.addInt("foo", "foo's description").defaultValue(11);
  inlet.addInt("bar", "bar's description").defaultValue(10);

  const bool jsonVerified = validateString(inlet, testString);

  EXPECT_FALSE(jsonVerified);
  EXPECT_EQ(inlet.verify(), jsonVerified);
}

TYPED_TEST(inlet_writer, top_level_ints_range_pass)
{
  std::string testString = "foo = 5; bar = 12";
  DataStore ds;
  Inlet inlet = createBasicInlet<TypeParam>(&ds, testString);

  inlet.addInt("foo", "foo's description").range(2, 10);
  inlet.addInt("bar", "bar's description").range(10, 15);

  const bool jsonVerified = validateString(inlet, testString);

  EXPECT_TRUE(jsonVerified);
  EXPECT_EQ(inlet.verify(), jsonVerified);
}

TYPED_TEST(inlet_writer, top_level_ints_range_fail)
{
  std::string testString = "foo = 12; bar = 5";
  DataStore ds;
  Inlet inlet = createBasicInlet<TypeParam>(&ds, testString);

  inlet.addInt("foo", "foo's description").range(2, 10);
  inlet.addInt("bar", "bar's description").range(10, 15);

  const bool jsonVerified = validateString(inlet, testString);

  EXPECT_FALSE(jsonVerified);
  EXPECT_EQ(inlet.verify(), jsonVerified);
}

TYPED_TEST(inlet_writer, top_level_ints_valid_set)
{
  std::string testString = "foo = 5; bar = 8";
  DataStore ds;
  Inlet inlet = createBasicInlet<TypeParam>(&ds, testString);

  inlet.addInt("foo", "foo's description").validValues({5, 7, 9});
  inlet.addInt("bar", "bar's description").validValues({4, 6, 8});

  const bool jsonVerified = validateString(inlet, testString);

  EXPECT_TRUE(jsonVerified);
  EXPECT_EQ(inlet.verify(), jsonVerified);
}

TYPED_TEST(inlet_writer, top_level_ints_valid_set_fail)
{
  std::string testString = "foo = 8; bar = 5";
  DataStore ds;
  Inlet inlet = createBasicInlet<TypeParam>(&ds, testString);

  inlet.addInt("foo", "foo's description").validValues({5, 7, 9});
  inlet.addInt("bar", "bar's description").validValues({4, 6, 8});

  const bool jsonVerified = validateString(inlet, testString);

  EXPECT_FALSE(jsonVerified);
  EXPECT_EQ(inlet.verify(), jsonVerified);
}

// Valid string values use different logic than other "simple" primitives
// so we test this separately
TYPED_TEST(inlet_writer, top_level_strings_valid_set)
{
  std::string testString = "foo = 'first'; bar = 'second'";
  DataStore ds;
  Inlet inlet = createBasicInlet<TypeParam>(&ds, testString);

  inlet.addString("foo", "foo's description").validValues({"first", "second"});
  inlet.addString("bar", "bar's description").validValues({"first", "second"});

  const bool jsonVerified = validateString(inlet, testString);

  EXPECT_TRUE(jsonVerified);
  EXPECT_EQ(inlet.verify(), jsonVerified);
}

TYPED_TEST(inlet_writer, top_level_strings_valid_set_fail)
{
  std::string testString = "foo = 'first'; bar = 'third'";
  DataStore ds;
  Inlet inlet = createBasicInlet<TypeParam>(&ds, testString);

  inlet.addString("foo", "foo's description").validValues({"first", "second"});
  inlet.addString("bar", "bar's description").validValues({"first", "second"});

  const bool jsonVerified = validateString(inlet, testString);

  EXPECT_FALSE(jsonVerified);
  EXPECT_EQ(inlet.verify(), jsonVerified);
}

//------------------------------------------------------------------------------
#include "axom/slic/core/SimpleLogger.hpp"
using axom::slic::SimpleLogger;

int main(int argc, char* argv[])
{
  int result = 0;

  ::testing::InitGoogleTest(&argc, argv);

  SimpleLogger logger;  // create & initialize test logger,

  // finalized when exiting main scope

  result = RUN_ALL_TESTS();

  return result;
}
