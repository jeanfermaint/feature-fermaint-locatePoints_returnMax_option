// typesQUEST.h
// This file is generated by Shroud 0.12.2. Do not edit.
//
// Copyright (c) 2017-2020, Lawrence Livermore National Security, LLC and
// other Axom Project Developers. See the top-level COPYRIGHT file for details.
//
// SPDX-License-Identifier: (BSD-3-Clause)
// For C users and C++ implementation

#ifndef TYPESQUEST_H
#define TYPESQUEST_H

#ifdef __cplusplus
extern "C" {
#endif

// helper capsule_data_helper
struct s_QUEST_SHROUD_capsule_data
{
  void* addr; /* address of C++ memory */
  int idtor;  /* index of destructor */
};
typedef struct s_QUEST_SHROUD_capsule_data QUEST_SHROUD_capsule_data;

void QUEST_SHROUD_memory_destructor(QUEST_SHROUD_capsule_data* cap);

#ifdef __cplusplus
}
#endif

#endif  // TYPESQUEST_H
