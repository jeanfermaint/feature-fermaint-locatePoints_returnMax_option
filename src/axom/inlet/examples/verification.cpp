// Copyright (c) 2017-2020, Lawrence Livermore National Security, LLC and
// other Axom Project Developers. See the top-level COPYRIGHT file for details.
//
// SPDX-License-Identifier: (BSD-3-Clause)

#include <iostream>

#include "axom/inlet.hpp"

int main() {
  // Initialize Inlet
  auto lr = std::make_shared<axom::inlet::LuaReader>();
  lr->parseString("dimensions = 2; vector = { x = 1; y = 2; z = 3; }");
  axom::sidre::DataStore ds;
  auto myInlet = std::make_shared<axom::inlet::Inlet>(lr, ds.getRoot());

  // _inlet_workflow_defining_schema_start
  // defines a required global field named "dimensions" with a default value of 2
  auto dimField = myInlet->addInt("dimensions")->required(true)->defaultValue(2);

  // defines a required table named vector with an internal field named 'x'
  auto v = myInlet->addTable("vector")->required(true);
  v->addInt("x");
  // _inlet_workflow_defining_schema_end

  // _inlet_workflow_verification_start
  v->registerVerifier([&]() -> bool {
    int dim;
    myInlet->get("dimensions", dim);
    int value;  // field value doesnt matter just that it is present in input deck
    bool x_present = v->hasField("x") && myInlet->get("vector/x", value);
    bool y_present = v->hasField("y") && myInlet->get("vector/y", value);
    bool z_present = v->hasField("z") && myInlet->get("vector/z", value);
    if(dim == 1 && x_present) {
      return true;
    }
    else if(dim == 2 && x_present && y_present) {
      return true;
    }
    else if(dim == 3 && x_present && y_present && z_present) {
      return true;
    }
    return false;
  });

  // We expect verification to be unsuccessful since the only Field
  // in vector is x but 2 dimensions are expected
  std::cout << "This should fail due to a missing dimension:\n";
  myInlet->verify() ? std::cout << "Verification was successful\n" 
                    : std::cout << "Verification was unsuccessful\n";
  
  // Add required dimension to schema
  v->addInt("y");

  // We expect the verification to succeed because vector now contains
  // both x and y to match the 2 dimensions
  std::cout << "After adding the required dimension:\n";
  myInlet->verify() ? std::cout << "Verification was successful\n" 
                    : std::cout << "Verification was unsuccessful\n";
  // _inlet_workflow_verification_end

  // _inlet_workflow_accessing_data_start
  int dim, x, y;
  bool dim_found, x_found, y_found;

  // Get dimensions if it was present in input deck
  dim_found = myInlet->get("dimensions", dim);
  if (dim_found) {
    std::cout << "Dimensions = " << dim << std::endl;
  }

  // Get vector information if it was present in input deck
  x_found = myInlet->get("vector/x", x);
  y_found = myInlet->get("vector/y", y);
  if (x_found && y_found) {
    std::cout << "Vector = " << x << "," << y << std::endl;
  }
  // _inlet_workflow_accessing_data_end

  return 0;
}