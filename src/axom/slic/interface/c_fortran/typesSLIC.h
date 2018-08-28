// typesSLIC.h
// This is generated code, do not edit
//
// Copyright (c) 2017-2018, Lawrence Livermore National Security, LLC.
//
// Produced at the Lawrence Livermore National Laboratory
//
// LLNL-CODE-741217
//
// All rights reserved.
//
// This file is part of Axom.
//
// For details about use and distribution, please read axom/LICENSE.
//
// For C users and C++ implementation

#ifndef TYPESSLIC_H
#define TYPESSLIC_H


#ifdef __cplusplus
extern "C" {
#endif

struct s_SLI_SHROUD_capsule_data {
    void *addr;     /* address of C++ memory */
    int idtor;      /* index of destructor */
};
typedef struct s_SLI_SHROUD_capsule_data SLI_SHROUD_capsule_data;

void SLIC_SHROUD_memory_destructor(SLI_SHROUD_capsule_data *cap);

#ifdef __cplusplus
}
#endif

#endif  // TYPESSLIC_H
