/*
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Copyright (c) 2017-2018, Lawrence Livermore National Security, LLC.
 *
 * Produced at the Lawrence Livermore National Laboratory
 *
 * LLNL-CODE-741217
 *
 * All rights reserved.
 *
 * This file is part of Axom.
 *
 * For details about use and distribution, please read axom/LICENSE.
 *
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

/*!
 *******************************************************************************
 * \file Message.hpp
 *
 * \brief This file contains the class definition of the Message.
 *******************************************************************************
 */

#ifndef MESSAGE_HPP
#define MESSAGE_HPP

#include <string>
#include <vector>

namespace axom
{
namespace lumberjack
{

/*!
 *****************************************************************************
 * \brief Delimiter used for packing messages and separating their members.
 *****************************************************************************
 */
const char memberDelimiter = '*';
/*!
 *****************************************************************************
 * \brief Delimiter used for packing messages and separating their individual
 *  tracked ranks.
 *****************************************************************************
 */
const char rankDelimiter = ',';

/*!
 *******************************************************************************
 * \class Message
 *
 * \brief Holds information about messages and where they came from.
 *
 *  This class holds all the information about an individual message and where
 *  it came from, such as rank, file name, and line number.
 *
 * \see Combiner Lumberjack
 *******************************************************************************
 */
class Message
{
public:
  // Constructors
  /*!
   *****************************************************************************
   * \brief Basic constructor where everything defaults to nothing.
   *****************************************************************************
   */
  Message()
    : m_text("")
    , m_ranks()
    , m_ranksCount(0)
    , m_fileName("")
    , m_lineNumber(0)
    , m_level(0)
    , m_tag("") {}

  /*!
   *****************************************************************************
   * \brief Constructor where you can specify all values for a Message that
   *  originated from a specific rank.
   *
   * \param [in] text Actual text of the Message.
   * \param [in] rank The rank where the Message originated.
   * \param [in] fileName The file name where the Message originated.
   * \param [in] lineNumber The line number where the Message originated.
   * \param [in] level The level of the severity of the Message.
   * \param [in] tag The tag of where the Message originated.
   *****************************************************************************
   */
  Message(const std::string& text, int rank,
          const std::string& fileName, int lineNumber,
          int level, const std::string& tag)
    : m_text(text)
    , m_ranks(1, rank)
    , m_ranksCount(1)
    , m_fileName(fileName)
    , m_lineNumber(lineNumber)
    , m_level(level)
    , m_tag(tag) {}

  /*!
   *****************************************************************************
   * \brief Constructor where you can specify all values for a Message that
   *  originated from a multiple ranks.
   *
   * \param [in] text Actual text of the Message.
   * \param [in] ranks The rank where the Message originated.
   * \param [in] ranksCount Total amount of ranks where this Message has
   *  originated from.
   * \param [in] ranksLimit Limit on how many ranks are individually tracked per
   *  Message.
   * \param [in] fileName The file name where the Message originated.
   * \param [in] lineNumber The line number where the Message originated.
   * \param [in] level The level of the severity of the Message.
   * \param [in] tag The tag of where the Message originated.
   *****************************************************************************
   */
  Message(const std::string& text, const std::vector<int>& ranks,
          int ranksCount, int ranksLimit,
          const std::string& fileName, int lineNumber,
          int level, const std::string& tag)
    : m_text(text)
    , m_ranks()
    , m_ranksCount(0)
    , m_fileName(fileName)
    , m_lineNumber(lineNumber)
    , m_level(level)
    , m_tag(tag)
  {
    addRanks(ranks, ranksCount, ranksLimit);
  }

  // Getters
  /*!
   *****************************************************************************
   * \brief Returns the text of the Message.
   *****************************************************************************
   */
  std::string text() const;

  /*!
   *****************************************************************************
   * \brief Returns the vector of the ranks where this Message originated.
   *****************************************************************************
   */
  std::vector<int> ranks() const;

  /*!
   *****************************************************************************
   * \brief Returns the total count of ranks where this Message originated.
   *****************************************************************************
   */
  int ranksCount() const;

  /*!
   *****************************************************************************
   * \brief Returns a string of ranks delimited by ',' unless otherwise
   *  specified.
   *
   * \param [in] delimiter The delimiter used to separate the ranks in returned
   *  string.
   *****************************************************************************
   */
  std::string stringOfRanks(std::string delimiter=",") const;

  /*!
   *****************************************************************************
   * \brief Returns the file name of where this Message originated.
   *****************************************************************************
   */
  std::string fileName() const;

  /*!
   *****************************************************************************
   * \brief Returns the line number of where this Message originated.
   *****************************************************************************
   */
  int lineNumber() const;

  /*!
   *****************************************************************************
   * \brief Returns the level of the severity of the Message.
   *****************************************************************************
   */
  int level() const;

  /*!
   *****************************************************************************
   * \brief Returns the tag of where the Message originated.
   *****************************************************************************
   */
  std::string tag() const;

  // Setters

  /*!
   *****************************************************************************
   * \brief Sets a new text for this Message.
   *
   * \param [in] newText The new text to be set for this Message.
   *****************************************************************************
   */
  void text(const std::string& newText);

  /*!
   *****************************************************************************
   * \brief Sets a new file name for this Message.
   *
   * \param [in] newFileName The new file name to be set for this Message.
   *****************************************************************************
   */
  void fileName(const std::string& newFileName);

  /*!
   *****************************************************************************
   * \brief Sets a new line number for this Message.
   *
   * \param [in] newLineNumber The new line number to be set for this message.
   *****************************************************************************
   */
  void lineNumber(int newLineNumber);

  /*!
   *****************************************************************************
   * \brief Sets a new severity level for this Message.
   *
   * \param [in] newLevel The new severity level for this Message.
   *****************************************************************************
   */
  void level(int newLevel);

  /*!
   *****************************************************************************
   * \brief Sets a new tag of where the Message originated.
   *
   * \param [in] newTag The new tag of where the Message originated.
   *****************************************************************************
   */
  void tag(const std::string& newTag);

  /*!
   *****************************************************************************
   * \brief Adds a rank to this Message.
   *
   * \param [in] newRank The new rank to be added.
   * \param [in] ranksLimit Limits how many ranks are tracked per  Message.
   *****************************************************************************
   */
  void addRank(int newRank, int ranksLimit);

  /*!
   *****************************************************************************
   * \brief Adds multiple ranks to this Message.  ranksCount is used to
   * increment since duplicates are removed from Message::ranks.
   *
   * \param [in] newRanks The new ranks to be added.
   * \param [in] ranksCount Count to add to Message::ranksCount
   * \param [in] ranksLimit Limits how many ranks are tracked per Message.
   *****************************************************************************
   */
  void addRanks(const std::vector<int>& newRanks, int ranksCount,
                int ranksLimit);

  // utilities

  /*!
   *****************************************************************************
   * \brief Returns a string of all information about this Message packed into a
   *  string.
   *
   * The Message is packed into a string utilizing the following format:
   *  \<ranks delimited by ,>*\<rank count>*\<file name>*\<line number>*\<text>
   *
   *****************************************************************************
   */
  std::string pack();

  /*!
   *****************************************************************************
   * \brief Overrides the information in this Message with the given packed
   *  string.
   *
   * \param [in] packedMessage Packed Message containing the new information.
   * \param [in] ranksLimit delimiter used to separate the ranks
   *
   * The Message is unpacked from a string utilizing the following format:
   *  \<ranks delimited by ,>*\<rank count>*\<file name>*\<line number>*\<text>
   *****************************************************************************
   */
  void unpack(const std::string& packedMessage, int ranksLimit);
private:
  void unpackRanks(const std::string& ranksString, int ranksLimit);

  std::string m_text;
  std::vector<int> m_ranks;
  int m_ranksCount;
  std::string m_fileName;
  int m_lineNumber;
  int m_level;
  std::string m_tag;
};

} // end namespace lumberjack
} // end namespace axom

#endif