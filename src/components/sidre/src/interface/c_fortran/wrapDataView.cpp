// wrapDataView.cpp
// This is generated code, do not edit
//
// Copyright (c) 2015, Lawrence Livermore National Security, LLC.
// Produced at the Lawrence Livermore National Laboratory.
//
// All rights reserved.
//
// This source code cannot be distributed without permission and
// further review from Lawrence Livermore National Laboratory.
//
// wrapDataView.cpp
#include "wrapDataView.h"
#include <string>
#include "shroudrt.hpp"
#include "sidre/DataView.hpp"
#include "sidre/SidreTypes.hpp"

extern "C" {
namespace axom {
namespace sidre {

void SIDRE_dataview_allocate_simple(SIDRE_dataview * self)
{
DataView *selfobj = static_cast<DataView *>(static_cast<void *>(self));
// splicer begin class.DataView.method.allocate_simple
    selfobj->allocate();
    return;
// splicer end class.DataView.method.allocate_simple
}

void SIDRE_dataview_allocate_from_type(SIDRE_dataview * self, int type, SIDRE_SidreLength num_elems)
{
DataView *selfobj = static_cast<DataView *>(static_cast<void *>(self));
// splicer begin class.DataView.method.allocate_from_type
    selfobj->allocate(getTypeID(type), num_elems);
    return;
// splicer end class.DataView.method.allocate_from_type
}

void SIDRE_dataview_reallocate(SIDRE_dataview * self, SIDRE_SidreLength num_elems)
{
DataView *selfobj = static_cast<DataView *>(static_cast<void *>(self));
// splicer begin class.DataView.method.reallocate
    selfobj->reallocate(num_elems);
    return;
// splicer end class.DataView.method.reallocate
}

void SIDRE_dataview_apply_0(SIDRE_dataview * self)
{
DataView *selfobj = static_cast<DataView *>(static_cast<void *>(self));
// splicer begin class.DataView.method.apply_0
    selfobj->apply();
    return;
// splicer end class.DataView.method.apply_0
}

void SIDRE_dataview_attach_buffer_only(SIDRE_dataview * self, SIDRE_buffer * buff)
{
DataView *selfobj = static_cast<DataView *>(static_cast<void *>(self));
// splicer begin class.DataView.method.attach_buffer_only
    selfobj->attachBuffer(static_cast<Buffer *>(static_cast<void *>(buff)));
    return;
// splicer end class.DataView.method.attach_buffer_only
}

void SIDRE_dataview_attach_buffer_type(SIDRE_dataview * self, int type, SIDRE_SidreLength num_elems, SIDRE_buffer * buff)
{
DataView *selfobj = static_cast<DataView *>(static_cast<void *>(self));
// splicer begin class.DataView.method.attach_buffer_type
    selfobj->attachBuffer(getTypeID(type), num_elems, static_cast<Buffer *>(static_cast<void *>(buff)));
    return;
// splicer end class.DataView.method.attach_buffer_type
}

void SIDRE_dataview_attach_buffer_shape(SIDRE_dataview * self, int type, int ndims, SIDRE_SidreLength * shape, SIDRE_buffer * buff)
{
DataView *selfobj = static_cast<DataView *>(static_cast<void *>(self));
// splicer begin class.DataView.method.attach_buffer_shape
    selfobj->attachBuffer(getTypeID(type), ndims, shape, static_cast<Buffer *>(static_cast<void *>(buff)));
    return;
// splicer end class.DataView.method.attach_buffer_shape
}

void SIDRE_dataview_apply_nelems(SIDRE_dataview * self, SIDRE_SidreLength num_elems)
{
DataView *selfobj = static_cast<DataView *>(static_cast<void *>(self));
// splicer begin class.DataView.method.apply_nelems
    selfobj->apply(num_elems);
    return;
// splicer end class.DataView.method.apply_nelems
}

void SIDRE_dataview_apply_nelems_offset(SIDRE_dataview * self, SIDRE_SidreLength num_elems, SIDRE_SidreLength offset)
{
DataView *selfobj = static_cast<DataView *>(static_cast<void *>(self));
// splicer begin class.DataView.method.apply_nelems_offset
    selfobj->apply(num_elems, offset);
    return;
// splicer end class.DataView.method.apply_nelems_offset
}

void SIDRE_dataview_apply_nelems_offset_stride(SIDRE_dataview * self, SIDRE_SidreLength num_elems, SIDRE_SidreLength offset, SIDRE_SidreLength stride)
{
DataView *selfobj = static_cast<DataView *>(static_cast<void *>(self));
// splicer begin class.DataView.method.apply_nelems_offset_stride
    selfobj->apply(num_elems, offset, stride);
    return;
// splicer end class.DataView.method.apply_nelems_offset_stride
}

void SIDRE_dataview_apply_type_nelems(SIDRE_dataview * self, int type, SIDRE_SidreLength num_elems)
{
DataView *selfobj = static_cast<DataView *>(static_cast<void *>(self));
// splicer begin class.DataView.method.apply_type_nelems
    selfobj->apply(getTypeID(type), num_elems);
    return;
// splicer end class.DataView.method.apply_type_nelems
}

void SIDRE_dataview_apply_type_nelems_offset(SIDRE_dataview * self, int type, SIDRE_SidreLength num_elems, SIDRE_SidreLength offset)
{
DataView *selfobj = static_cast<DataView *>(static_cast<void *>(self));
// splicer begin class.DataView.method.apply_type_nelems_offset
    selfobj->apply(getTypeID(type), num_elems, offset);
    return;
// splicer end class.DataView.method.apply_type_nelems_offset
}

void SIDRE_dataview_apply_type_nelems_offset_stride(SIDRE_dataview * self, int type, SIDRE_SidreLength num_elems, SIDRE_SidreLength offset, SIDRE_SidreLength stride)
{
DataView *selfobj = static_cast<DataView *>(static_cast<void *>(self));
// splicer begin class.DataView.method.apply_type_nelems_offset_stride
    selfobj->apply(getTypeID(type), num_elems, offset, stride);
    return;
// splicer end class.DataView.method.apply_type_nelems_offset_stride
}

void SIDRE_dataview_apply_type_shape(SIDRE_dataview * self, int type, int ndims, SIDRE_SidreLength * shape)
{
DataView *selfobj = static_cast<DataView *>(static_cast<void *>(self));
// splicer begin class.DataView.method.apply_type_shape
    selfobj->apply(getTypeID(type), ndims, shape);
    return;
// splicer end class.DataView.method.apply_type_shape
}

bool SIDRE_dataview_has_buffer(const SIDRE_dataview * self)
{
const DataView *selfobj = static_cast<const DataView *>(static_cast<const void *>(self));
// splicer begin class.DataView.method.has_buffer
    bool rv = selfobj->hasBuffer();
    return rv;
// splicer end class.DataView.method.has_buffer
}

bool SIDRE_dataview_is_external(const SIDRE_dataview * self)
{
const DataView *selfobj = static_cast<const DataView *>(static_cast<const void *>(self));
// splicer begin class.DataView.method.is_external
    bool rv = selfobj->isExternal();
    return rv;
// splicer end class.DataView.method.is_external
}

bool SIDRE_dataview_is_allocated(SIDRE_dataview * self)
{
DataView *selfobj = static_cast<DataView *>(static_cast<void *>(self));
// splicer begin class.DataView.method.is_allocated
    bool rv = selfobj->isAllocated();
    return rv;
// splicer end class.DataView.method.is_allocated
}

bool SIDRE_dataview_is_applied(const SIDRE_dataview * self)
{
const DataView *selfobj = static_cast<const DataView *>(static_cast<const void *>(self));
// splicer begin class.DataView.method.is_applied
    bool rv = selfobj->isApplied();
    return rv;
// splicer end class.DataView.method.is_applied
}

bool SIDRE_dataview_is_described(const SIDRE_dataview * self)
{
const DataView *selfobj = static_cast<const DataView *>(static_cast<const void *>(self));
// splicer begin class.DataView.method.is_described
    bool rv = selfobj->isDescribed();
    return rv;
// splicer end class.DataView.method.is_described
}

bool SIDRE_dataview_is_empty(const SIDRE_dataview * self)
{
const DataView *selfobj = static_cast<const DataView *>(static_cast<const void *>(self));
// splicer begin class.DataView.method.is_empty
    bool rv = selfobj->isEmpty();
    return rv;
// splicer end class.DataView.method.is_empty
}

bool SIDRE_dataview_is_opaque(const SIDRE_dataview * self)
{
const DataView *selfobj = static_cast<const DataView *>(static_cast<const void *>(self));
// splicer begin class.DataView.method.is_opaque
    bool rv = selfobj->isOpaque();
    return rv;
// splicer end class.DataView.method.is_opaque
}

bool SIDRE_dataview_is_scalar(const SIDRE_dataview * self)
{
const DataView *selfobj = static_cast<const DataView *>(static_cast<const void *>(self));
// splicer begin class.DataView.method.is_scalar
    bool rv = selfobj->isScalar();
    return rv;
// splicer end class.DataView.method.is_scalar
}

bool SIDRE_dataview_is_string(const SIDRE_dataview * self)
{
const DataView *selfobj = static_cast<const DataView *>(static_cast<const void *>(self));
// splicer begin class.DataView.method.is_string
    bool rv = selfobj->isString();
    return rv;
// splicer end class.DataView.method.is_string
}

const char * SIDRE_dataview_get_name(const SIDRE_dataview * self)
{
const DataView *selfobj = static_cast<const DataView *>(static_cast<const void *>(self));
// splicer begin class.DataView.method.get_name
    const std::string & rv = selfobj->getName();
    return rv.c_str();
// splicer end class.DataView.method.get_name
}

void SIDRE_dataview_get_name_bufferify(const SIDRE_dataview * self, char * SH_F_rv, int LSH_F_rv)
{
const DataView *selfobj = static_cast<const DataView *>(static_cast<const void *>(self));
// splicer begin class.DataView.method.get_name_bufferify
    const std::string & rv = selfobj->getName();
    shroud::FccCopy(SH_F_rv, LSH_F_rv, rv.c_str());
    return;
// splicer end class.DataView.method.get_name_bufferify
}

SIDRE_buffer * SIDRE_dataview_get_buffer(SIDRE_dataview * self)
{
DataView *selfobj = static_cast<DataView *>(static_cast<void *>(self));
// splicer begin class.DataView.method.get_buffer
    Buffer * rv = selfobj->getBuffer();
    return static_cast<SIDRE_buffer *>(static_cast<void *>(rv));
// splicer end class.DataView.method.get_buffer
}

void * SIDRE_dataview_get_void_ptr(const SIDRE_dataview * self)
{
const DataView *selfobj = static_cast<const DataView *>(static_cast<const void *>(self));
// splicer begin class.DataView.method.get_void_ptr
    void * rv = selfobj->getVoidPtr();
    return rv;
// splicer end class.DataView.method.get_void_ptr
}

void SIDRE_dataview_set_scalar_int(SIDRE_dataview * self, int value)
{
DataView *selfobj = static_cast<DataView *>(static_cast<void *>(self));
// splicer begin class.DataView.method.set_scalar_int
    selfobj->setScalar<int>(value);
    return;
// splicer end class.DataView.method.set_scalar_int
}

void SIDRE_dataview_set_scalar_long(SIDRE_dataview * self, long value)
{
DataView *selfobj = static_cast<DataView *>(static_cast<void *>(self));
// splicer begin class.DataView.method.set_scalar_long
    selfobj->setScalar<long>(value);
    return;
// splicer end class.DataView.method.set_scalar_long
}

void SIDRE_dataview_set_scalar_float(SIDRE_dataview * self, float value)
{
DataView *selfobj = static_cast<DataView *>(static_cast<void *>(self));
// splicer begin class.DataView.method.set_scalar_float
    selfobj->setScalar<float>(value);
    return;
// splicer end class.DataView.method.set_scalar_float
}

void SIDRE_dataview_set_scalar_double(SIDRE_dataview * self, double value)
{
DataView *selfobj = static_cast<DataView *>(static_cast<void *>(self));
// splicer begin class.DataView.method.set_scalar_double
    selfobj->setScalar<double>(value);
    return;
// splicer end class.DataView.method.set_scalar_double
}

void SIDRE_dataview_set_external_data_ptr_only(SIDRE_dataview * self, void * external_ptr)
{
DataView *selfobj = static_cast<DataView *>(static_cast<void *>(self));
// splicer begin class.DataView.method.set_external_data_ptr_only
    selfobj->setExternalDataPtr(external_ptr);
    return;
// splicer end class.DataView.method.set_external_data_ptr_only
}

void SIDRE_dataview_set_external_data_ptr_type(SIDRE_dataview * self, int type, SIDRE_SidreLength num_elems, void * external_ptr)
{
DataView *selfobj = static_cast<DataView *>(static_cast<void *>(self));
// splicer begin class.DataView.method.set_external_data_ptr_type
    selfobj->setExternalDataPtr(getTypeID(type), num_elems, external_ptr);
    return;
// splicer end class.DataView.method.set_external_data_ptr_type
}

void SIDRE_dataview_set_string(SIDRE_dataview * self, const char * value)
{
DataView *selfobj = static_cast<DataView *>(static_cast<void *>(self));
// splicer begin class.DataView.method.set_string
    const std::string SH_value(value);
    selfobj->setString(SH_value);
    return;
// splicer end class.DataView.method.set_string
}

void SIDRE_dataview_set_string_bufferify(SIDRE_dataview * self, const char * value, int Lvalue)
{
DataView *selfobj = static_cast<DataView *>(static_cast<void *>(self));
// splicer begin class.DataView.method.set_string_bufferify
    const std::string SH_value(value, Lvalue);
    selfobj->setString(SH_value);
    return;
// splicer end class.DataView.method.set_string_bufferify
}

void SIDRE_dataview_set_external_data_ptr_shape(SIDRE_dataview * self, int type, int ndims, SIDRE_SidreLength * shape, void * external_ptr)
{
DataView *selfobj = static_cast<DataView *>(static_cast<void *>(self));
// splicer begin class.DataView.method.set_external_data_ptr_shape
    selfobj->setExternalDataPtr(getTypeID(type), ndims, shape, external_ptr);
    return;
// splicer end class.DataView.method.set_external_data_ptr_shape
}

const char * SIDRE_dataview_get_string(SIDRE_dataview * self)
{
DataView *selfobj = static_cast<DataView *>(static_cast<void *>(self));
// splicer begin class.DataView.method.get_string
    const char * rv = selfobj->getString();
    return rv;
// splicer end class.DataView.method.get_string
}

void SIDRE_dataview_get_string_bufferify(SIDRE_dataview * self, char * name, int Lname)
{
DataView *selfobj = static_cast<DataView *>(static_cast<void *>(self));
// splicer begin class.DataView.method.get_string_bufferify
    const char * rv = selfobj->getString();
    shroud::FccCopy(name, Lname, rv);
    return;
// splicer end class.DataView.method.get_string_bufferify
}

int SIDRE_dataview_get_data_int(SIDRE_dataview * self)
{
DataView *selfobj = static_cast<DataView *>(static_cast<void *>(self));
// splicer begin class.DataView.method.get_data_int
    int rv = selfobj->getData<int>();
    return rv;
// splicer end class.DataView.method.get_data_int
}

long SIDRE_dataview_get_data_long(SIDRE_dataview * self)
{
DataView *selfobj = static_cast<DataView *>(static_cast<void *>(self));
// splicer begin class.DataView.method.get_data_long
    long rv = selfobj->getData<long>();
    return rv;
// splicer end class.DataView.method.get_data_long
}

float SIDRE_dataview_get_data_float(SIDRE_dataview * self)
{
DataView *selfobj = static_cast<DataView *>(static_cast<void *>(self));
// splicer begin class.DataView.method.get_data_float
    float rv = selfobj->getData<float>();
    return rv;
// splicer end class.DataView.method.get_data_float
}

double SIDRE_dataview_get_data_double(SIDRE_dataview * self)
{
DataView *selfobj = static_cast<DataView *>(static_cast<void *>(self));
// splicer begin class.DataView.method.get_data_double
    double rv = selfobj->getData<double>();
    return rv;
// splicer end class.DataView.method.get_data_double
}

SIDRE_group * SIDRE_dataview_get_owning_group(SIDRE_dataview * self)
{
DataView *selfobj = static_cast<DataView *>(static_cast<void *>(self));
// splicer begin class.DataView.method.get_owning_group
    Group * rv = selfobj->getOwningGroup();
    return static_cast<SIDRE_group *>(static_cast<void *>(rv));
// splicer end class.DataView.method.get_owning_group
}

int SIDRE_dataview_get_type_id(const SIDRE_dataview * self)
{
const DataView *selfobj = static_cast<const DataView *>(static_cast<const void *>(self));
// splicer begin class.DataView.method.get_type_id
    TypeID rv = selfobj->getTypeID();
    return static_cast<int>(rv);
// splicer end class.DataView.method.get_type_id
}

size_t SIDRE_dataview_get_total_bytes(const SIDRE_dataview * self)
{
const DataView *selfobj = static_cast<const DataView *>(static_cast<const void *>(self));
// splicer begin class.DataView.method.get_total_bytes
    size_t rv = selfobj->getTotalBytes();
    return rv;
// splicer end class.DataView.method.get_total_bytes
}

size_t SIDRE_dataview_get_bytes_per_element(const SIDRE_dataview * self)
{
const DataView *selfobj = static_cast<const DataView *>(static_cast<const void *>(self));
// splicer begin class.DataView.method.get_bytes_per_element
    size_t rv = selfobj->getBytesPerElement();
    return rv;
// splicer end class.DataView.method.get_bytes_per_element
}

size_t SIDRE_dataview_get_num_elements(const SIDRE_dataview * self)
{
const DataView *selfobj = static_cast<const DataView *>(static_cast<const void *>(self));
// splicer begin class.DataView.method.get_num_elements
    size_t rv = selfobj->getNumElements();
    return rv;
// splicer end class.DataView.method.get_num_elements
}

size_t SIDRE_dataview_get_offset(const SIDRE_dataview * self)
{
const DataView *selfobj = static_cast<const DataView *>(static_cast<const void *>(self));
// splicer begin class.DataView.method.get_offset
    size_t rv = selfobj->getOffset();
    return rv;
// splicer end class.DataView.method.get_offset
}

size_t SIDRE_dataview_get_stride(const SIDRE_dataview * self)
{
const DataView *selfobj = static_cast<const DataView *>(static_cast<const void *>(self));
// splicer begin class.DataView.method.get_stride
    size_t rv = selfobj->getStride();
    return rv;
// splicer end class.DataView.method.get_stride
}

int SIDRE_dataview_get_num_dimensions(const SIDRE_dataview * self)
{
const DataView *selfobj = static_cast<const DataView *>(static_cast<const void *>(self));
// splicer begin class.DataView.method.get_num_dimensions
    int rv = selfobj->getNumDimensions();
    return rv;
// splicer end class.DataView.method.get_num_dimensions
}

int SIDRE_dataview_get_shape(const SIDRE_dataview * self, int ndims, SIDRE_SidreLength * shape)
{
const DataView *selfobj = static_cast<const DataView *>(static_cast<const void *>(self));
// splicer begin class.DataView.method.get_shape
    int rv = selfobj->getShape(ndims, shape);
    return rv;
// splicer end class.DataView.method.get_shape
}

bool SIDRE_dataview_rename(SIDRE_dataview * self, const char * new_name)
{
DataView *selfobj = static_cast<DataView *>(static_cast<void *>(self));
// splicer begin class.DataView.method.rename
    const std::string SH_new_name(new_name);
    bool rv = selfobj->rename(SH_new_name);
    return rv;
// splicer end class.DataView.method.rename
}

bool SIDRE_dataview_rename_bufferify(SIDRE_dataview * self, const char * new_name, int Lnew_name)
{
DataView *selfobj = static_cast<DataView *>(static_cast<void *>(self));
// splicer begin class.DataView.method.rename_bufferify
    const std::string SH_new_name(new_name, Lnew_name);
    bool rv = selfobj->rename(SH_new_name);
    return rv;
// splicer end class.DataView.method.rename_bufferify
}

void SIDRE_dataview_print(const SIDRE_dataview * self)
{
const DataView *selfobj = static_cast<const DataView *>(static_cast<const void *>(self));
// splicer begin class.DataView.method.print
    selfobj->print();
    return;
// splicer end class.DataView.method.print
}

// splicer begin class.DataView.additional_functions
// splicer end class.DataView.additional_functions

}  // namespace axom
}  // namespace sidre
}  // extern "C"
