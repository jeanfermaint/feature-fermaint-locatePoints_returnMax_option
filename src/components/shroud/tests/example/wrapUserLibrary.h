// wrapUserLibrary.h
// This is generated code, do not edit
// blah blah
// yada yada
//
// For C users and C++ implementation

#ifndef WRAPUSERLIBRARY_H
#define WRAPUSERLIBRARY_H

#ifdef __cplusplus
extern "C" {
#endif

// declaration of wrapped types

// splicer begin C_definition
// splicer end C_definition

void AA_local_function1();

bool AA_is_name_valid(const char * name);

bool AA_is_name_valid_bufferify(const char * name, int Lname);

void AA_test_names(const char * name);

void AA_test_names_bufferify(const char * name, int Lname);

void AA_test_names_flag(const char * name, int flag);

void AA_test_names_flag_bufferify(const char * name, int Lname, int flag);

#ifdef __cplusplus
}
#endif

#endif  // WRAPUSERLIBRARY_H
