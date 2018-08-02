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
 *  \file CommonTypes.hpp
 *
 *  \brief File exposing some common types used by axom components.
 *
 */

#ifndef AXOM_TYPES_HPP_
#define AXOM_TYPES_HPP_


#include "axom/config.hpp"           // defines AXOM_USE_CXX11
#include "axom/core/detail/cstdint_wrapper.hpp"  // fixed bitwidth integer types

#ifndef AXOM_USE_CXX11
  #include <cstddef>            // brings in NULL
#endif

namespace axom
{
namespace common
{

typedef detail::int8_t int8;        /*!< 8-bit signed integer type      */
typedef detail::uint8_t uint8;      /*!< 8-bit unsigned integer type    */

typedef detail::int16_t int16;      /*!< 16-bit signed integer type     */
typedef detail::uint16_t uint16;    /*!< 16-bit unsigned integer type   */

typedef detail::int32_t int32;      /*!< 32-bit signed integer type     */
typedef detail::uint32_t uint32;    /*!< 32-bit unsigned integer type   */

// Note: KW -- We assume that AXOM_NO_INT64_T will be defined
// on systems/compilers that do not support 64 bit integer types
#ifndef AXOM_NO_INT64_T
typedef detail::int64_t int64;      /*!< 64-bit signed integer type     */
typedef detail::uint64_t uint64;    /*!< 64-bit unsigned integer type   */
#endif

typedef float float32;
typedef double float64;


} // end namespace core
} // end namespace axom


#endif // AXOM_TYPES_HPP_
