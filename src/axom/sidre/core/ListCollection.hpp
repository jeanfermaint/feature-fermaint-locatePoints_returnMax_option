// Copyright (c) 2017-2020, Lawrence Livermore National Security, LLC and
// other Axom Project Developers. See the top-level COPYRIGHT file for details.
//
// SPDX-License-Identifier: (BSD-3-Clause)

/*!
 ******************************************************************************
 *
 * \file ListCollection.hpp
 *
 * \brief   Header file for Collection classes.
 *
 *          Each of these classes holds a collection of items of a fixed
 *          type that can be accessed by an iterator or sidre::IndexType.
 *
 *          The primary intent is to decouple the implementation of the
 *          collections from the Group class which owns collections of
 *          View and child Group objects. They may have other uses,
 *          so they are not dependent on the Group class. Each class is
 *          templated on the item type so that the same class can be used
 *          to hold either View or Group object pointers without
 *          having to code a separate class for each.
 *
 *          By having various collections that obey the same interface,
 *          we can explore alternative collection implementations for
 *          performance (insertion, lookup, etc.) and memory overhead.
 *          The collection used by the Group class can be changed via
 *          the collection type alias in the Group class header file.
 *
 *          To try another collection, encapsulate it in a new class with
 *          the API described below or pass it as a template parameter to
 *          an existing class below if that works.
 *
 *          \attention These classes should be robust against any potential
 *                     user interaction. They don't report errors and leave
 *                     checking of return values to calling code.
 *
 *          \attention Template parameter type must provide a method
 *                     "getName()" that returns a reference to a string object.
 *
 *          \attention The common interface each collection class provides
 *                     is as follows:
 *
 *          \verbatim
 *
 *          - // Return number of items in collection.
 *
 *               size_t getNumItems() const;
 *
 *          - // Return first valid item index (i.e., smallest index over
 *            // all items).
 *            // sidre::InvalidIndex returned if no items in collection
 *
 *               IndexType getFirstValidIndex() const;
 *
 *          - // Return next valid item index after given index (i.e., smallest
 *            // index over all indices larger than given one).
 *            // sidre::InvalidIndex returned
 *
 *               IndexType getNextValidIndex(IndexType idx) const;
 *
 *          - // Return true if item with given name in collection; else false.
 *
 *               bool hasItem(const std::string& name) const;
 *
 *          - // Return true if item with given index in collection; else false.
 *
 *               bool hasItem(IndexType idx) const;
 *
 *          - // Return pointer to item with given name (nullptr if none).
 *
 *               TYPE* getItem(const std::string& name);
 *               TYPE const* getItem(const std::string& name) const ;
 *
 *          - // Return pointer to item with given index (nullptr if none).
 *
 *               TYPE* getItem(IndexType idx);
 *               TYPE const* getItem(IndexType idx) const;
 *
 *          - // Return name of object with given index
 *            // (sidre::InvalidName if none).
 *
 *               std::string getItemName(IndexType idx) const;
 *
 *          - // Return index of object with given name
 *            // (sidre::InvalidName if none).
 *
 *               IndexType getItemIndex(const std::string& name) const;
 *
 *          - // Insert item with given name; return index if insertion
 *            // succeeded, and InvalidIndex otherwise.
 *
 *               IndexType insertItem(TYPE* item, const std::string& name);
 *
 *          - // Remove item with given name if it exists and return a
 *            // pointer to it. If it doesn't exist, return nullptr.
 *
 *               TYPE* removeItem(const std::string& name);
 *
 *          - // Remove item with given name if it exists and return a
 *            // pointer to it. If it doesn't exist, return nullptr.
 *
 *               TYPE* removeItem(IndexType idx);
 *
 *          - // Remove all items (items not destroyed).
 *
 *               void removeAllItems();
 *
 *          - // Clear all items and destroy them.
 *
 *               void deleteAllItems();
 *
 *          \endverbatim
 *
 ******************************************************************************
 */

#ifndef SIDRE_LISTCOLLECTIONS_HPP_
#define SIDRE_LISTCOLLECTIONS_HPP_

// Standard C++ headers
#include <map>
#include <list>
#include <stack>
#include <string>
#include <vector>

// Other axom headers
#include "axom/config.hpp"
#include "axom/core/Types.hpp"

// Sidre project headers
#include "SidreTypes.hpp"
#include "ItemCollection.hpp"



namespace axom
{
namespace sidre
{

////////////////////////////////////////////////////////////////////////
//
// ListCollection keeps an index constant for each item
// as long as it remains in the collection; i.e., don't shift indices
// around.  It has the additional benefit that users can hold on to
// item indices without them being changed without notice.
//
////////////////////////////////////////////////////////////////////////

/*!
 *************************************************************************
 *
 * \class ListCollection
 *
 * \brief ListCollection is a container class template for holding
 *        a collection of items of template parameter type TYPE, using
 *        a list container.
 *
 *************************************************************************
 */
template <typename TYPE>
class ListCollection : public ItemCollection<TYPE>
{
public:

  //
  // Default compiler-generated ctor, dtor, copy ctor, and copy assignment
  // operator suffice for this class.
  //

  ///
  size_t getNumItems() const
  {
    return m_items.size() - m_free_ids.size();
  }

  ///
  IndexType getFirstValidIndex() const;

  ///
  IndexType getNextValidIndex(IndexType idx) const;

  ///
  bool hasItem(const std::string& name) const
  {
    SLIC_ERROR(" ");
    return false;
  }

  ///
  bool hasItem(IndexType idx) const
  {
    return (idx >= 0 &&
            static_cast<unsigned>(idx) < m_items.size() &&
            m_items[static_cast<unsigned>(idx)]);
  }

  ///
  TYPE* getItem(const std::string& name)
  {
    SLIC_ERROR(" ");
    return 0;
  }

  ///
  TYPE const* getItem(const std::string& name) const
  {
    SLIC_ERROR(" ");
    return 0;
  }

  ///
  TYPE* getItem(IndexType idx)
  {
    return ( hasItem(idx) ? m_items[static_cast<unsigned>(idx)] : nullptr );
  }

  ///
  TYPE const* getItem(IndexType idx) const
  {
    return ( hasItem(idx) ? m_items[static_cast<unsigned>(idx)] : nullptr );
  }

  ///
  const std::string& getItemName(IndexType idx) const
  {
    return InvalidName;
  }

  ///
  IndexType getItemIndex(const std::string& name) const
  {
    SLIC_ERROR(" ");
    return 0;
  }

  ///
  IndexType insertItem(TYPE* item, const std::string& name);

  ///
  TYPE* removeItem(const std::string& name);

  ///
  TYPE* removeItem(IndexType idx);

  ///
  void removeAllItems()
  {
    m_items.clear();
    while ( !m_free_ids.empty() )
    {
      m_free_ids.pop();
    }
    m_index_list.clear();
  }

private:
  std::vector<TYPE*>  m_items;
  std::stack< IndexType > m_free_ids;

  std::list< IndexType > m_index_list;

};

template <typename TYPE>
IndexType ListCollection<TYPE>::getFirstValidIndex() const
{
  IndexType idx = 0;
  while ( static_cast<unsigned>(idx) < m_items.size() &&
          m_items[static_cast<unsigned>(idx)] == nullptr )
  {
    idx++;
  }
  return ( (static_cast<unsigned>(idx) < m_items.size()) ? idx : InvalidIndex );
}

template <typename TYPE>
IndexType ListCollection<TYPE>::getNextValidIndex(IndexType idx) const
{
  if (idx == InvalidIndex)
  {
    return InvalidIndex;
  }

  idx++;
  while ( static_cast<unsigned>(idx) < m_items.size() &&
          m_items[static_cast<unsigned>(idx)] == nullptr )
  {
    idx++;
  }
  return ( (static_cast<unsigned>(idx) < m_items.size()) ? idx : InvalidIndex );
}


template <typename TYPE>
IndexType ListCollection<TYPE>::insertItem(TYPE* item,
                                           const std::string& name)
{
  SLIC_WARNING_IF(!name.empty(),
                  "Item " << name << " added to Group "
                  << "which holds items in list format. "
                  << "The name of this item will be ignored.");

  bool use_recycled_index = false;
  IndexType idx = m_items.size();
  if ( !m_free_ids.empty() )
  {
    idx = m_free_ids.top();
    m_free_ids.pop();
    use_recycled_index = true;
  }

  m_index_list.push_back(idx);

  if ( use_recycled_index )
  {
    m_items[idx] = item;
  }
  else
  {
    m_items.push_back(item);
  }
  return idx;
}

template <typename TYPE>
TYPE* ListCollection<TYPE>::removeItem(const std::string& name)
{
  SLIC_ERROR( " " );
  return 0; 
}

template <typename TYPE>
TYPE* ListCollection<TYPE>::removeItem(IndexType idx)
{
  TYPE* ret_val = nullptr;
  if ( hasItem(idx) )
  {
    for (auto itr = m_index_list.begin(); itr != m_index_list.end(); ++itr)
    {
      if (*itr == idx)
      {
        ret_val = m_items[idx];
        m_index_list.erase(itr);
        m_items[idx] = nullptr;
        m_free_ids.push(idx);
        break;
      }
    }
  }

  return ret_val;
}

} /* end namespace sidre */
} /* end namespace axom */

#endif /* SIDRE_LIST_COLLECTIONS_HPP_ */
