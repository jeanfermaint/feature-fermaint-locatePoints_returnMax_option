// wrapTutorial.h
// This is generated code, do not edit
// wrapTutorial.h
// For C users and C++ implementation

#ifndef WRAPTUTORIAL_H
#define WRAPTUTORIAL_H

#ifdef __cplusplus
extern "C" {
#endif

// declaration of wrapped types
#ifdef EXAMPLE_WRAPPER_IMPL
#else
#endif

// splicer begin C_definition
// splicer end C_definition

void TUT_function1();

double TUT_function2(double arg1, int arg2);

bool TUT_function3(bool arg);

const char * TUT_function4a(const char * arg1, const char * arg2);

const char * TUT_function4b(const char * arg1, const char * arg2);

double TUT_function5(double arg1, int arg2);

void TUT_function6_from_name(const char * name);

void TUT_function6_from_index(int indx);

#ifdef __cplusplus
}
#endif

#endif  // WRAPTUTORIAL_H
