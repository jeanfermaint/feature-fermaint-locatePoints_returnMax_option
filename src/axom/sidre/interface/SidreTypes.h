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

/**
 *  \file SidreTypes.h
 *
 *  \brief File containing C types and constants used in
 *         SiDRe toolkit component.
 *
 */
#ifndef SIDRETYPES_H
#define SIDRETYPES_H

#include "axom/sidre/core/SidreDataTypeIds.h"
#include <stdint.h>

typedef int64_t SIDRE_IndexType;

#define SIDRE_InvalidIndex ((SIDRE_IndexType) -1)

#define SIDRE_InvalidName   NULL



#endif  // SIDRETYPES_H
