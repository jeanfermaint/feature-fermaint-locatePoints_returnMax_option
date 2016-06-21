! wrapfsidre.f
! This is generated code, do not edit
!
! Copyright (c) 2015, Lawrence Livermore National Security, LLC.
! Produced at the Lawrence Livermore National Laboratory.
!
! All rights reserved.
!
! This source code cannot be distributed without permission and
! further review from Lawrence Livermore National Laboratory.
!
!>
!! \file wrapfsidre.f
!! \brief Shroud generated wrapper for Sidre library
!<
module sidre_mod
    use, intrinsic :: iso_c_binding, only : C_PTR
    ! splicer begin module_use
    ! map conduit type names to sidre type names
    use conduit, only : &
        SIDRE_NO_TYPE_ID    => CONDUIT_EMPTY_ID, &
        SIDRE_INT8_ID       => CONDUIT_INT8_ID, &
        SIDRE_INT16_ID      => CONDUIT_INT16_ID, &
        SIDRE_INT32_ID      => CONDUIT_INT32_ID, &
        SIDRE_INT64_ID      => CONDUIT_INT64_ID, &
        SIDRE_UINT8_ID      => CONDUIT_UINT8_ID, &
        SIDRE_UINT16_ID     => CONDUIT_UINT16_ID, &
        SIDRE_UINT32_ID     => CONDUIT_UINT32_ID, &
        SIDRE_UINT64_ID     => CONDUIT_UINT64_ID, &
        SIDRE_FLOAT32_ID    => CONDUIT_FLOAT32_ID, &
        SIDRE_FLOAT64_ID    => CONDUIT_FLOAT64_ID, &
        SIDRE_CHAR8_STR_ID  => CONDUIT_CHAR8_STR_ID, &
        SIDRE_INT_ID        => CONDUIT_INT_ID, &
        SIDRE_UINT_ID       => CONDUIT_UINT_ID, &
        SIDRE_LONG_ID       => CONDUIT_LONG_ID, &
        SIDRE_ULONG_ID      => CONDUIT_ULONG_ID, &
        SIDRE_FLOAT_ID      => CONDUIT_FLOAT_ID, &
        SIDRE_DOUBLE_ID     => CONDUIT_DOUBLE_ID
    use, intrinsic :: iso_c_binding, only : C_LONG
    ! splicer end module_use
    ! splicer begin class.DataStore.module_use
    ! splicer end class.DataStore.module_use
    ! splicer begin class.DataGroup.module_use
    ! splicer end class.DataGroup.module_use
    ! splicer begin class.DataBuffer.module_use
    ! splicer end class.DataBuffer.module_use
    ! splicer begin class.DataView.module_use
    ! splicer end class.DataView.module_use
    implicit none
    
    ! splicer begin module_top
    integer, parameter :: MAXNAMESIZE = 128
    
    integer, parameter :: SIDRE_LENGTH = C_LONG
    
    integer, parameter :: invalid_index = -1
    ! splicer end module_top
    
    ! splicer begin class.DataStore.module_top
    ! splicer end class.DataStore.module_top
    
    type datastore
        type(C_PTR), private :: voidptr
        ! splicer begin class.DataStore.component_part
        ! splicer end class.DataStore.component_part
    contains
        procedure :: delete => datastore_delete
        procedure :: get_root => datastore_get_root
        procedure :: get_buffer => datastore_get_buffer
        procedure :: create_buffer_empty => datastore_create_buffer_empty
        procedure :: create_buffer_from_type_int => datastore_create_buffer_from_type_int
        procedure :: create_buffer_from_type_long => datastore_create_buffer_from_type_long
        procedure :: destroy_buffer => datastore_destroy_buffer
        procedure :: get_num_buffers => datastore_get_num_buffers
        procedure :: print => datastore_print
        procedure :: save_0 => datastore_save_0
        procedure :: save_1 => datastore_save_1
        procedure :: load_0 => datastore_load_0
        procedure :: load_1 => datastore_load_1
        procedure :: load_external_data_0 => datastore_load_external_data_0
        procedure :: load_external_data_1 => datastore_load_external_data_1
        procedure :: get_instance => datastore_get_instance
        procedure :: set_instance => datastore_set_instance
        procedure :: associated => datastore_associated
        generic :: create_buffer => &
            ! splicer begin class.DataStore.generic.create_buffer
            ! splicer end class.DataStore.generic.create_buffer
            create_buffer_empty,  &
            create_buffer_from_type_int,  &
            create_buffer_from_type_long
        generic :: load => &
            ! splicer begin class.DataStore.generic.load
            ! splicer end class.DataStore.generic.load
            load_0,  &
            load_1
        generic :: load_external_data => &
            ! splicer begin class.DataStore.generic.load_external_data
            ! splicer end class.DataStore.generic.load_external_data
            load_external_data_0,  &
            load_external_data_1
        generic :: save => &
            ! splicer begin class.DataStore.generic.save
            ! splicer end class.DataStore.generic.save
            save_0,  &
            save_1
        ! splicer begin class.DataStore.type_bound_procedure_part
        ! splicer end class.DataStore.type_bound_procedure_part
    end type datastore
    
    ! splicer begin class.DataGroup.module_top
    ! splicer end class.DataGroup.module_top
    
    type datagroup
        type(C_PTR), private :: voidptr
        ! splicer begin class.DataGroup.component_part
        ! splicer end class.DataGroup.component_part
    contains
        procedure :: get_name => datagroup_get_name
        procedure :: get_parent => datagroup_get_parent
        procedure :: get_data_store => datagroup_get_data_store
        procedure :: get_num_views => datagroup_get_num_views
        procedure :: get_num_groups => datagroup_get_num_groups
        procedure :: has_view => datagroup_has_view
        procedure :: get_view_from_name => datagroup_get_view_from_name
        procedure :: get_view_from_index => datagroup_get_view_from_index
        procedure :: get_view_index => datagroup_get_view_index
        procedure :: get_view_name => datagroup_get_view_name
        procedure :: get_first_valid_view_index => datagroup_get_first_valid_view_index
        procedure :: get_next_valid_view_index => datagroup_get_next_valid_view_index
        procedure :: create_view_and_allocate_nelems_int => datagroup_create_view_and_allocate_nelems_int
        procedure :: create_view_and_allocate_nelems_long => datagroup_create_view_and_allocate_nelems_long
        procedure :: create_view_and_allocate_shape => datagroup_create_view_and_allocate_shape
        procedure :: create_view_scalar_int => datagroup_create_view_scalar_int
        procedure :: create_view_scalar_long => datagroup_create_view_scalar_long
        procedure :: create_view_scalar_float => datagroup_create_view_scalar_float
        procedure :: create_view_scalar_double => datagroup_create_view_scalar_double
        procedure :: create_view_string => datagroup_create_view_string
        procedure :: create_view_empty => datagroup_create_view_empty
        procedure :: create_view_from_type_int => datagroup_create_view_from_type_int
        procedure :: create_view_from_type_long => datagroup_create_view_from_type_long
        procedure :: create_view_from_type_and_buffer_int => datagroup_create_view_from_type_and_buffer_int
        procedure :: create_view_from_type_and_buffer_long => datagroup_create_view_from_type_and_buffer_long
        procedure :: create_view_from_type_external_int => datagroup_create_view_from_type_external_int
        procedure :: create_view_from_type_external_long => datagroup_create_view_from_type_external_long
        procedure :: create_view_from_shape => datagroup_create_view_from_shape
        procedure :: create_view_from_shape_and_buffer => datagroup_create_view_from_shape_and_buffer
        procedure :: create_view_from_shape_external => datagroup_create_view_from_shape_external
        procedure :: create_view_into_buffer => datagroup_create_view_into_buffer
        procedure :: create_view_external => datagroup_create_view_external
        procedure :: destroy_view => datagroup_destroy_view
        procedure :: destroy_view_and_data_name => datagroup_destroy_view_and_data_name
        procedure :: destroy_view_and_data_index => datagroup_destroy_view_and_data_index
        procedure :: move_view => datagroup_move_view
        procedure :: copy_view => datagroup_copy_view
        procedure :: has_group => datagroup_has_group
        procedure :: get_group => datagroup_get_group
        procedure :: get_group_index => datagroup_get_group_index
        procedure :: get_group_name => datagroup_get_group_name
        procedure :: get_first_valid_group_index => datagroup_get_first_valid_group_index
        procedure :: get_next_valid_group_index => datagroup_get_next_valid_group_index
        procedure :: create_group => datagroup_create_group
        procedure :: destroy_group_name => datagroup_destroy_group_name
        procedure :: destroy_group_index => datagroup_destroy_group_index
        procedure :: move_group => datagroup_move_group
        procedure :: print => datagroup_print
        procedure :: is_equivalent_to => datagroup_is_equivalent_to
        procedure :: get_instance => datagroup_get_instance
        procedure :: set_instance => datagroup_set_instance
        procedure :: associated => datagroup_associated
        generic :: create_view => &
            ! splicer begin class.DataGroup.generic.create_view
            ! splicer end class.DataGroup.generic.create_view
            create_view_empty,  &
            create_view_from_type_int,  &
            create_view_from_type_long,  &
            create_view_from_type_and_buffer_int,  &
            create_view_from_type_and_buffer_long,  &
            create_view_from_type_external_int,  &
            create_view_from_type_external_long,  &
            create_view_from_shape,  &
            create_view_from_shape_and_buffer,  &
            create_view_from_shape_external,  &
            create_view_into_buffer,  &
            create_view_external
        generic :: create_view_and_allocate => &
            ! splicer begin class.DataGroup.generic.create_view_and_allocate
            ! splicer end class.DataGroup.generic.create_view_and_allocate
            create_view_and_allocate_nelems_int,  &
            create_view_and_allocate_nelems_long,  &
            create_view_and_allocate_shape
        generic :: create_view_scalar => &
            ! splicer begin class.DataGroup.generic.create_view_scalar
            ! splicer end class.DataGroup.generic.create_view_scalar
            create_view_scalar_int,  &
            create_view_scalar_long,  &
            create_view_scalar_float,  &
            create_view_scalar_double
        generic :: destroy_group => &
            ! splicer begin class.DataGroup.generic.destroy_group
            ! splicer end class.DataGroup.generic.destroy_group
            destroy_group_name,  &
            destroy_group_index
        generic :: destroy_view_and_data => &
            ! splicer begin class.DataGroup.generic.destroy_view_and_data
            ! splicer end class.DataGroup.generic.destroy_view_and_data
            destroy_view_and_data_name,  &
            destroy_view_and_data_index
        generic :: get_view => &
            ! splicer begin class.DataGroup.generic.get_view
            ! splicer end class.DataGroup.generic.get_view
            get_view_from_name,  &
            get_view_from_index
        ! splicer begin class.DataGroup.type_bound_procedure_part
        procedure :: create_array_view_int_scalar => datagroup_create_array_view_int_scalar
        procedure :: create_array_view_int_1d => datagroup_create_array_view_int_1d
        procedure :: create_array_view_int_2d => datagroup_create_array_view_int_2d
        procedure :: create_array_view_int_3d => datagroup_create_array_view_int_3d
        procedure :: create_array_view_int_4d => datagroup_create_array_view_int_4d
        procedure :: create_array_view_long_scalar => datagroup_create_array_view_long_scalar
        procedure :: create_array_view_long_1d => datagroup_create_array_view_long_1d
        procedure :: create_array_view_long_2d => datagroup_create_array_view_long_2d
        procedure :: create_array_view_long_3d => datagroup_create_array_view_long_3d
        procedure :: create_array_view_long_4d => datagroup_create_array_view_long_4d
        procedure :: create_array_view_float_scalar => datagroup_create_array_view_float_scalar
        procedure :: create_array_view_float_1d => datagroup_create_array_view_float_1d
        procedure :: create_array_view_float_2d => datagroup_create_array_view_float_2d
        procedure :: create_array_view_float_3d => datagroup_create_array_view_float_3d
        procedure :: create_array_view_float_4d => datagroup_create_array_view_float_4d
        procedure :: create_array_view_double_scalar => datagroup_create_array_view_double_scalar
        procedure :: create_array_view_double_1d => datagroup_create_array_view_double_1d
        procedure :: create_array_view_double_2d => datagroup_create_array_view_double_2d
        procedure :: create_array_view_double_3d => datagroup_create_array_view_double_3d
        procedure :: create_array_view_double_4d => datagroup_create_array_view_double_4d
        generic :: create_array_view => &
            create_array_view_int_scalar,  &
            create_array_view_int_1d,  &
            create_array_view_int_2d,  &
            create_array_view_int_3d,  &
            create_array_view_int_4d,  &
            create_array_view_long_scalar,  &
            create_array_view_long_1d,  &
            create_array_view_long_2d,  &
            create_array_view_long_3d,  &
            create_array_view_long_4d,  &
            create_array_view_float_scalar,  &
            create_array_view_float_1d,  &
            create_array_view_float_2d,  &
            create_array_view_float_3d,  &
            create_array_view_float_4d,  &
            create_array_view_double_scalar,  &
            create_array_view_double_1d,  &
            create_array_view_double_2d,  &
            create_array_view_double_3d,  &
            create_array_view_double_4d
        procedure :: set_array_data_ptr_int_scalar => datagroup_set_array_data_ptr_int_scalar
        procedure :: set_array_data_ptr_int_1d => datagroup_set_array_data_ptr_int_1d
        procedure :: set_array_data_ptr_int_2d => datagroup_set_array_data_ptr_int_2d
        procedure :: set_array_data_ptr_int_3d => datagroup_set_array_data_ptr_int_3d
        procedure :: set_array_data_ptr_int_4d => datagroup_set_array_data_ptr_int_4d
        procedure :: set_array_data_ptr_long_scalar => datagroup_set_array_data_ptr_long_scalar
        procedure :: set_array_data_ptr_long_1d => datagroup_set_array_data_ptr_long_1d
        procedure :: set_array_data_ptr_long_2d => datagroup_set_array_data_ptr_long_2d
        procedure :: set_array_data_ptr_long_3d => datagroup_set_array_data_ptr_long_3d
        procedure :: set_array_data_ptr_long_4d => datagroup_set_array_data_ptr_long_4d
        procedure :: set_array_data_ptr_float_scalar => datagroup_set_array_data_ptr_float_scalar
        procedure :: set_array_data_ptr_float_1d => datagroup_set_array_data_ptr_float_1d
        procedure :: set_array_data_ptr_float_2d => datagroup_set_array_data_ptr_float_2d
        procedure :: set_array_data_ptr_float_3d => datagroup_set_array_data_ptr_float_3d
        procedure :: set_array_data_ptr_float_4d => datagroup_set_array_data_ptr_float_4d
        procedure :: set_array_data_ptr_double_scalar => datagroup_set_array_data_ptr_double_scalar
        procedure :: set_array_data_ptr_double_1d => datagroup_set_array_data_ptr_double_1d
        procedure :: set_array_data_ptr_double_2d => datagroup_set_array_data_ptr_double_2d
        procedure :: set_array_data_ptr_double_3d => datagroup_set_array_data_ptr_double_3d
        procedure :: set_array_data_ptr_double_4d => datagroup_set_array_data_ptr_double_4d
        generic :: set_array_data_ptr => &
            set_array_data_ptr_int_scalar,  &
            set_array_data_ptr_int_1d,  &
            set_array_data_ptr_int_2d,  &
            set_array_data_ptr_int_3d,  &
            set_array_data_ptr_int_4d,  &
            set_array_data_ptr_long_scalar,  &
            set_array_data_ptr_long_1d,  &
            set_array_data_ptr_long_2d,  &
            set_array_data_ptr_long_3d,  &
            set_array_data_ptr_long_4d,  &
            set_array_data_ptr_float_scalar,  &
            set_array_data_ptr_float_1d,  &
            set_array_data_ptr_float_2d,  &
            set_array_data_ptr_float_3d,  &
            set_array_data_ptr_float_4d,  &
            set_array_data_ptr_double_scalar,  &
            set_array_data_ptr_double_1d,  &
            set_array_data_ptr_double_2d,  &
            set_array_data_ptr_double_3d,  &
            set_array_data_ptr_double_4d
        ! splicer end class.DataGroup.type_bound_procedure_part
    end type datagroup
    
    ! splicer begin class.DataBuffer.module_top
    ! splicer end class.DataBuffer.module_top
    
    type databuffer
        type(C_PTR), private :: voidptr
        ! splicer begin class.DataBuffer.component_part
        ! splicer end class.DataBuffer.component_part
    contains
        procedure :: get_index => databuffer_get_index
        procedure :: get_num_views => databuffer_get_num_views
        procedure :: describe_int => databuffer_describe_int
        procedure :: describe_long => databuffer_describe_long
        procedure :: allocate_existing => databuffer_allocate_existing
        procedure :: allocate_from_type_int => databuffer_allocate_from_type_int
        procedure :: allocate_from_type_long => databuffer_allocate_from_type_long
        procedure :: reallocate_int => databuffer_reallocate_int
        procedure :: reallocate_long => databuffer_reallocate_long
        procedure :: get_void_ptr => databuffer_get_void_ptr
        procedure :: get_type_id => databuffer_get_type_id
        procedure :: get_num_elements => databuffer_get_num_elements
        procedure :: get_total_bytes => databuffer_get_total_bytes
        procedure :: print => databuffer_print
        procedure :: get_instance => databuffer_get_instance
        procedure :: set_instance => databuffer_set_instance
        procedure :: associated => databuffer_associated
        generic :: allocate => &
            ! splicer begin class.DataBuffer.generic.allocate
            ! splicer end class.DataBuffer.generic.allocate
            allocate_existing,  &
            allocate_from_type_int,  &
            allocate_from_type_long
        generic :: describe => &
            ! splicer begin class.DataBuffer.generic.describe
            ! splicer end class.DataBuffer.generic.describe
            describe_int,  &
            describe_long
        generic :: reallocate => &
            ! splicer begin class.DataBuffer.generic.reallocate
            ! splicer end class.DataBuffer.generic.reallocate
            reallocate_int,  &
            reallocate_long
        ! splicer begin class.DataBuffer.type_bound_procedure_part
        ! splicer end class.DataBuffer.type_bound_procedure_part
    end type databuffer
    
    ! splicer begin class.DataView.module_top
    ! splicer end class.DataView.module_top
    
    type dataview
        type(C_PTR), private :: voidptr
        ! splicer begin class.DataView.component_part
        ! splicer end class.DataView.component_part
    contains
        procedure :: allocate_simple => dataview_allocate_simple
        procedure :: allocate_from_type_int => dataview_allocate_from_type_int
        procedure :: allocate_from_type_long => dataview_allocate_from_type_long
        procedure :: reallocate_int => dataview_reallocate_int
        procedure :: reallocate_long => dataview_reallocate_long
        procedure :: apply_0 => dataview_apply_0
        procedure :: attach_buffer_only => dataview_attach_buffer_only
        procedure :: attach_buffer_type_int => dataview_attach_buffer_type_int
        procedure :: attach_buffer_type_long => dataview_attach_buffer_type_long
        procedure :: attach_buffer_shape => dataview_attach_buffer_shape
        procedure :: apply_nelems => dataview_apply_nelems
        procedure :: apply_nelems_offset => dataview_apply_nelems_offset
        procedure :: apply_nelems_offset_stride => dataview_apply_nelems_offset_stride
        procedure :: apply_type_nelems => dataview_apply_type_nelems
        procedure :: apply_type_nelems_offset => dataview_apply_type_nelems_offset
        procedure :: apply_type_nelems_offset_stride => dataview_apply_type_nelems_offset_stride
        procedure :: apply_type_shape => dataview_apply_type_shape
        procedure :: has_buffer => dataview_has_buffer
        procedure :: is_external => dataview_is_external
        procedure :: is_applied => dataview_is_applied
        procedure :: is_described => dataview_is_described
        procedure :: is_empty => dataview_is_empty
        procedure :: is_opaque => dataview_is_opaque
        procedure :: get_name => dataview_get_name
        procedure :: get_buffer => dataview_get_buffer
        procedure :: get_void_ptr => dataview_get_void_ptr
        procedure :: set_scalar_int => dataview_set_scalar_int
        procedure :: set_scalar_long => dataview_set_scalar_long
        procedure :: set_scalar_float => dataview_set_scalar_float
        procedure :: set_scalar_double => dataview_set_scalar_double
        procedure :: set_external_data_ptr_only => dataview_set_external_data_ptr_only
        procedure :: set_external_data_ptr_type_int => dataview_set_external_data_ptr_type_int
        procedure :: set_external_data_ptr_type_long => dataview_set_external_data_ptr_type_long
        procedure :: set_external_data_ptr_shape => dataview_set_external_data_ptr_shape
        procedure :: get_string => dataview_get_string
        procedure :: get_data_int => dataview_get_data_int
        procedure :: get_data_long => dataview_get_data_long
        procedure :: get_data_float => dataview_get_data_float
        procedure :: get_data_double => dataview_get_data_double
        procedure :: get_owning_group => dataview_get_owning_group
        procedure :: get_type_id => dataview_get_type_id
        procedure :: get_total_bytes => dataview_get_total_bytes
        procedure :: get_num_elements => dataview_get_num_elements
        procedure :: get_num_dimensions => dataview_get_num_dimensions
        procedure :: get_shape => dataview_get_shape
        procedure :: print => dataview_print
        procedure :: get_instance => dataview_get_instance
        procedure :: set_instance => dataview_set_instance
        procedure :: associated => dataview_associated
        generic :: allocate => &
            ! splicer begin class.DataView.generic.allocate
            ! splicer end class.DataView.generic.allocate
            allocate_simple,  &
            allocate_from_type_int,  &
            allocate_from_type_long
        generic :: apply => &
            ! splicer begin class.DataView.generic.apply
            ! splicer end class.DataView.generic.apply
            apply_0,  &
            apply_nelems,  &
            apply_nelems_offset,  &
            apply_nelems_offset_stride,  &
            apply_type_nelems,  &
            apply_type_nelems_offset,  &
            apply_type_nelems_offset_stride,  &
            apply_type_shape
        generic :: attach_buffer => &
            ! splicer begin class.DataView.generic.attach_buffer
            ! splicer end class.DataView.generic.attach_buffer
            attach_buffer_only,  &
            attach_buffer_type_int,  &
            attach_buffer_type_long,  &
            attach_buffer_shape
        generic :: reallocate => &
            ! splicer begin class.DataView.generic.reallocate
            ! splicer end class.DataView.generic.reallocate
            reallocate_int,  &
            reallocate_long
        generic :: set_external_data_ptr => &
            ! splicer begin class.DataView.generic.set_external_data_ptr
            ! splicer end class.DataView.generic.set_external_data_ptr
            set_external_data_ptr_only,  &
            set_external_data_ptr_type_int,  &
            set_external_data_ptr_type_long,  &
            set_external_data_ptr_shape
        generic :: set_scalar => &
            ! splicer begin class.DataView.generic.set_scalar
            ! splicer end class.DataView.generic.set_scalar
            set_scalar_int,  &
            set_scalar_long,  &
            set_scalar_float,  &
            set_scalar_double
        ! splicer begin class.DataView.type_bound_procedure_part
        procedure :: get_data_int_scalar_ptr => dataview_get_data_int_scalar_ptr
        procedure :: get_data_int_1d_ptr => dataview_get_data_int_1d_ptr
        procedure :: get_data_int_2d_ptr => dataview_get_data_int_2d_ptr
        procedure :: get_data_int_3d_ptr => dataview_get_data_int_3d_ptr
        procedure :: get_data_int_4d_ptr => dataview_get_data_int_4d_ptr
        procedure :: get_data_long_scalar_ptr => dataview_get_data_long_scalar_ptr
        procedure :: get_data_long_1d_ptr => dataview_get_data_long_1d_ptr
        procedure :: get_data_long_2d_ptr => dataview_get_data_long_2d_ptr
        procedure :: get_data_long_3d_ptr => dataview_get_data_long_3d_ptr
        procedure :: get_data_long_4d_ptr => dataview_get_data_long_4d_ptr
        procedure :: get_data_float_scalar_ptr => dataview_get_data_float_scalar_ptr
        procedure :: get_data_float_1d_ptr => dataview_get_data_float_1d_ptr
        procedure :: get_data_float_2d_ptr => dataview_get_data_float_2d_ptr
        procedure :: get_data_float_3d_ptr => dataview_get_data_float_3d_ptr
        procedure :: get_data_float_4d_ptr => dataview_get_data_float_4d_ptr
        procedure :: get_data_double_scalar_ptr => dataview_get_data_double_scalar_ptr
        procedure :: get_data_double_1d_ptr => dataview_get_data_double_1d_ptr
        procedure :: get_data_double_2d_ptr => dataview_get_data_double_2d_ptr
        procedure :: get_data_double_3d_ptr => dataview_get_data_double_3d_ptr
        procedure :: get_data_double_4d_ptr => dataview_get_data_double_4d_ptr
        generic :: get_data => &
            get_data_int_scalar_ptr,  &
            get_data_int_1d_ptr,  &
            get_data_int_2d_ptr,  &
            get_data_int_3d_ptr,  &
            get_data_int_4d_ptr,  &
            get_data_long_scalar_ptr,  &
            get_data_long_1d_ptr,  &
            get_data_long_2d_ptr,  &
            get_data_long_3d_ptr,  &
            get_data_long_4d_ptr,  &
            get_data_float_scalar_ptr,  &
            get_data_float_1d_ptr,  &
            get_data_float_2d_ptr,  &
            get_data_float_3d_ptr,  &
            get_data_float_4d_ptr,  &
            get_data_double_scalar_ptr,  &
            get_data_double_1d_ptr,  &
            get_data_double_2d_ptr,  &
            get_data_double_3d_ptr,  &
            get_data_double_4d_ptr
        procedure :: set_array_data_ptr_int_scalar => dataview_set_array_data_ptr_int_scalar
        procedure :: set_array_data_ptr_int_1d => dataview_set_array_data_ptr_int_1d
        procedure :: set_array_data_ptr_int_2d => dataview_set_array_data_ptr_int_2d
        procedure :: set_array_data_ptr_int_3d => dataview_set_array_data_ptr_int_3d
        procedure :: set_array_data_ptr_int_4d => dataview_set_array_data_ptr_int_4d
        procedure :: set_array_data_ptr_long_scalar => dataview_set_array_data_ptr_long_scalar
        procedure :: set_array_data_ptr_long_1d => dataview_set_array_data_ptr_long_1d
        procedure :: set_array_data_ptr_long_2d => dataview_set_array_data_ptr_long_2d
        procedure :: set_array_data_ptr_long_3d => dataview_set_array_data_ptr_long_3d
        procedure :: set_array_data_ptr_long_4d => dataview_set_array_data_ptr_long_4d
        procedure :: set_array_data_ptr_float_scalar => dataview_set_array_data_ptr_float_scalar
        procedure :: set_array_data_ptr_float_1d => dataview_set_array_data_ptr_float_1d
        procedure :: set_array_data_ptr_float_2d => dataview_set_array_data_ptr_float_2d
        procedure :: set_array_data_ptr_float_3d => dataview_set_array_data_ptr_float_3d
        procedure :: set_array_data_ptr_float_4d => dataview_set_array_data_ptr_float_4d
        procedure :: set_array_data_ptr_double_scalar => dataview_set_array_data_ptr_double_scalar
        procedure :: set_array_data_ptr_double_1d => dataview_set_array_data_ptr_double_1d
        procedure :: set_array_data_ptr_double_2d => dataview_set_array_data_ptr_double_2d
        procedure :: set_array_data_ptr_double_3d => dataview_set_array_data_ptr_double_3d
        procedure :: set_array_data_ptr_double_4d => dataview_set_array_data_ptr_double_4d
        generic :: set_array_data_ptr => &
            set_array_data_ptr_int_scalar,  &
            set_array_data_ptr_int_1d,  &
            set_array_data_ptr_int_2d,  &
            set_array_data_ptr_int_3d,  &
            set_array_data_ptr_int_4d,  &
            set_array_data_ptr_long_scalar,  &
            set_array_data_ptr_long_1d,  &
            set_array_data_ptr_long_2d,  &
            set_array_data_ptr_long_3d,  &
            set_array_data_ptr_long_4d,  &
            set_array_data_ptr_float_scalar,  &
            set_array_data_ptr_float_1d,  &
            set_array_data_ptr_float_2d,  &
            set_array_data_ptr_float_3d,  &
            set_array_data_ptr_float_4d,  &
            set_array_data_ptr_double_scalar,  &
            set_array_data_ptr_double_1d,  &
            set_array_data_ptr_double_2d,  &
            set_array_data_ptr_double_3d,  &
            set_array_data_ptr_double_4d
        ! splicer end class.DataView.type_bound_procedure_part
    end type dataview
    
    
    interface operator (.eq.)
        module procedure datastore_eq
        module procedure datagroup_eq
        module procedure databuffer_eq
        module procedure dataview_eq
    end interface
    
    interface operator (.ne.)
        module procedure datastore_ne
        module procedure datagroup_ne
        module procedure databuffer_ne
        module procedure dataview_ne
    end interface
    
    interface
        
        function c_datastore_new() &
                result(rv) &
                bind(C, name="SIDRE_datastore_new")
            use iso_c_binding
            implicit none
            type(C_PTR) :: rv
        end function c_datastore_new
        
        subroutine c_datastore_delete(self) &
                bind(C, name="SIDRE_datastore_delete")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
        end subroutine c_datastore_delete
        
        function c_datastore_get_root(self) &
                result(rv) &
                bind(C, name="SIDRE_datastore_get_root")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            type(C_PTR) :: rv
        end function c_datastore_get_root
        
        function c_datastore_get_buffer(self, idx) &
                result(rv) &
                bind(C, name="SIDRE_datastore_get_buffer")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            integer(C_INT), value, intent(IN) :: idx
            type(C_PTR) :: rv
        end function c_datastore_get_buffer
        
        function c_datastore_create_buffer_empty(self) &
                result(rv) &
                bind(C, name="SIDRE_datastore_create_buffer_empty")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            type(C_PTR) :: rv
        end function c_datastore_create_buffer_empty
        
        function c_datastore_create_buffer_from_type(self, type, num_elems) &
                result(rv) &
                bind(C, name="SIDRE_datastore_create_buffer_from_type")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            integer(C_INT), value, intent(IN) :: type
            integer(C_LONG), value, intent(IN) :: num_elems
            type(C_PTR) :: rv
        end function c_datastore_create_buffer_from_type
        
        subroutine c_datastore_destroy_buffer(self, id) &
                bind(C, name="SIDRE_datastore_destroy_buffer")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            integer(C_INT), value, intent(IN) :: id
        end subroutine c_datastore_destroy_buffer
        
        pure function c_datastore_get_num_buffers(self) &
                result(rv) &
                bind(C, name="SIDRE_datastore_get_num_buffers")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            integer(C_SIZE_T) :: rv
        end function c_datastore_get_num_buffers
        
        subroutine c_datastore_print(self) &
                bind(C, name="SIDRE_datastore_print")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
        end subroutine c_datastore_print
        
        subroutine c_datastore_save_0(self, file_path, protocol) &
                bind(C, name="SIDRE_datastore_save_0")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: file_path(*)
            character(kind=C_CHAR), intent(IN) :: protocol(*)
        end subroutine c_datastore_save_0
        
        subroutine c_datastore_save_0_bufferify(self, file_path, Lfile_path, protocol, Lprotocol) &
                bind(C, name="SIDRE_datastore_save_0_bufferify")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: file_path(*)
            integer(C_INT), value, intent(IN) :: Lfile_path
            character(kind=C_CHAR), intent(IN) :: protocol(*)
            integer(C_INT), value, intent(IN) :: Lprotocol
        end subroutine c_datastore_save_0_bufferify
        
        subroutine c_datastore_save_1(self, file_path, protocol, group) &
                bind(C, name="SIDRE_datastore_save_1")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: file_path(*)
            character(kind=C_CHAR), intent(IN) :: protocol(*)
            type(C_PTR), value, intent(IN) :: group
        end subroutine c_datastore_save_1
        
        subroutine c_datastore_save_1_bufferify(self, file_path, Lfile_path, protocol, Lprotocol, group) &
                bind(C, name="SIDRE_datastore_save_1_bufferify")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: file_path(*)
            integer(C_INT), value, intent(IN) :: Lfile_path
            character(kind=C_CHAR), intent(IN) :: protocol(*)
            integer(C_INT), value, intent(IN) :: Lprotocol
            type(C_PTR), value, intent(IN) :: group
        end subroutine c_datastore_save_1_bufferify
        
        subroutine c_datastore_load_0(self, file_path, protocol) &
                bind(C, name="SIDRE_datastore_load_0")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: file_path(*)
            character(kind=C_CHAR), intent(IN) :: protocol(*)
        end subroutine c_datastore_load_0
        
        subroutine c_datastore_load_0_bufferify(self, file_path, Lfile_path, protocol, Lprotocol) &
                bind(C, name="SIDRE_datastore_load_0_bufferify")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: file_path(*)
            integer(C_INT), value, intent(IN) :: Lfile_path
            character(kind=C_CHAR), intent(IN) :: protocol(*)
            integer(C_INT), value, intent(IN) :: Lprotocol
        end subroutine c_datastore_load_0_bufferify
        
        subroutine c_datastore_load_1(self, file_path, protocol, group) &
                bind(C, name="SIDRE_datastore_load_1")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: file_path(*)
            character(kind=C_CHAR), intent(IN) :: protocol(*)
            type(C_PTR), value, intent(IN) :: group
        end subroutine c_datastore_load_1
        
        subroutine c_datastore_load_1_bufferify(self, file_path, Lfile_path, protocol, Lprotocol, group) &
                bind(C, name="SIDRE_datastore_load_1_bufferify")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: file_path(*)
            integer(C_INT), value, intent(IN) :: Lfile_path
            character(kind=C_CHAR), intent(IN) :: protocol(*)
            integer(C_INT), value, intent(IN) :: Lprotocol
            type(C_PTR), value, intent(IN) :: group
        end subroutine c_datastore_load_1_bufferify
        
        subroutine c_datastore_load_external_data_0(self, file_path, protocol) &
                bind(C, name="SIDRE_datastore_load_external_data_0")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: file_path(*)
            character(kind=C_CHAR), intent(IN) :: protocol(*)
        end subroutine c_datastore_load_external_data_0
        
        subroutine c_datastore_load_external_data_0_bufferify(self, file_path, Lfile_path, protocol, Lprotocol) &
                bind(C, name="SIDRE_datastore_load_external_data_0_bufferify")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: file_path(*)
            integer(C_INT), value, intent(IN) :: Lfile_path
            character(kind=C_CHAR), intent(IN) :: protocol(*)
            integer(C_INT), value, intent(IN) :: Lprotocol
        end subroutine c_datastore_load_external_data_0_bufferify
        
        subroutine c_datastore_load_external_data_1(self, file_path, protocol, group) &
                bind(C, name="SIDRE_datastore_load_external_data_1")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: file_path(*)
            character(kind=C_CHAR), intent(IN) :: protocol(*)
            type(C_PTR), value, intent(IN) :: group
        end subroutine c_datastore_load_external_data_1
        
        subroutine c_datastore_load_external_data_1_bufferify(self, file_path, Lfile_path, protocol, Lprotocol, group) &
                bind(C, name="SIDRE_datastore_load_external_data_1_bufferify")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: file_path(*)
            integer(C_INT), value, intent(IN) :: Lfile_path
            character(kind=C_CHAR), intent(IN) :: protocol(*)
            integer(C_INT), value, intent(IN) :: Lprotocol
            type(C_PTR), value, intent(IN) :: group
        end subroutine c_datastore_load_external_data_1_bufferify
        
        ! splicer begin class.DataStore.additional_interfaces
        ! splicer end class.DataStore.additional_interfaces
        
        pure function c_datagroup_get_name(self) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_get_name")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            type(C_PTR) rv
        end function c_datagroup_get_name
        
        subroutine c_datagroup_get_name_bufferify(self, SH_F_rv, LSH_F_rv) &
                bind(C, name="SIDRE_datagroup_get_name_bufferify")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(OUT) :: SH_F_rv(*)
            integer(C_INT), value, intent(IN) :: LSH_F_rv
        end subroutine c_datagroup_get_name_bufferify
        
        pure function c_datagroup_get_parent(self) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_get_parent")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            type(C_PTR) :: rv
        end function c_datagroup_get_parent
        
        pure function c_datagroup_get_data_store(self) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_get_data_store")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            type(C_PTR) :: rv
        end function c_datagroup_get_data_store
        
        pure function c_datagroup_get_num_views(self) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_get_num_views")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            integer(C_SIZE_T) :: rv
        end function c_datagroup_get_num_views
        
        pure function c_datagroup_get_num_groups(self) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_get_num_groups")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            integer(C_SIZE_T) :: rv
        end function c_datagroup_get_num_groups
        
        function c_datagroup_has_view(self, name) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_has_view")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            logical(C_BOOL) :: rv
        end function c_datagroup_has_view
        
        function c_datagroup_has_view_bufferify(self, name, Lname) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_has_view_bufferify")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            integer(C_INT), value, intent(IN) :: Lname
            logical(C_BOOL) :: rv
        end function c_datagroup_has_view_bufferify
        
        function c_datagroup_get_view_from_name(self, name) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_get_view_from_name")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            type(C_PTR) :: rv
        end function c_datagroup_get_view_from_name
        
        function c_datagroup_get_view_from_name_bufferify(self, name, Lname) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_get_view_from_name_bufferify")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            integer(C_INT), value, intent(IN) :: Lname
            type(C_PTR) :: rv
        end function c_datagroup_get_view_from_name_bufferify
        
        function c_datagroup_get_view_from_index(self, idx) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_get_view_from_index")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            integer(C_INT), value, intent(IN) :: idx
            type(C_PTR) :: rv
        end function c_datagroup_get_view_from_index
        
        pure function c_datagroup_get_view_index(self, name) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_get_view_index")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            integer(C_INT) :: rv
        end function c_datagroup_get_view_index
        
        pure function c_datagroup_get_view_index_bufferify(self, name, Lname) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_get_view_index_bufferify")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            integer(C_INT), value, intent(IN) :: Lname
            integer(C_INT) :: rv
        end function c_datagroup_get_view_index_bufferify
        
        pure function c_datagroup_get_view_name(self, idx) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_get_view_name")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            integer(C_INT), value, intent(IN) :: idx
            type(C_PTR) rv
        end function c_datagroup_get_view_name
        
        subroutine c_datagroup_get_view_name_bufferify(self, idx, SH_F_rv, LSH_F_rv) &
                bind(C, name="SIDRE_datagroup_get_view_name_bufferify")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            integer(C_INT), value, intent(IN) :: idx
            character(kind=C_CHAR), intent(OUT) :: SH_F_rv(*)
            integer(C_INT), value, intent(IN) :: LSH_F_rv
        end subroutine c_datagroup_get_view_name_bufferify
        
        pure function c_datagroup_get_first_valid_view_index(self) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_get_first_valid_view_index")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            integer(C_INT) :: rv
        end function c_datagroup_get_first_valid_view_index
        
        pure function c_datagroup_get_next_valid_view_index(self, idx) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_get_next_valid_view_index")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            integer(C_INT), value, intent(IN) :: idx
            integer(C_INT) :: rv
        end function c_datagroup_get_next_valid_view_index
        
        function c_datagroup_create_view_and_allocate_nelems(self, name, type, num_elems) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_create_view_and_allocate_nelems")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            integer(C_INT), value, intent(IN) :: type
            integer(C_LONG), value, intent(IN) :: num_elems
            type(C_PTR) :: rv
        end function c_datagroup_create_view_and_allocate_nelems
        
        function c_datagroup_create_view_and_allocate_nelems_bufferify(self, name, Lname, type, num_elems) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_create_view_and_allocate_nelems_bufferify")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            integer(C_INT), value, intent(IN) :: Lname
            integer(C_INT), value, intent(IN) :: type
            integer(C_LONG), value, intent(IN) :: num_elems
            type(C_PTR) :: rv
        end function c_datagroup_create_view_and_allocate_nelems_bufferify
        
        function c_datagroup_create_view_and_allocate_shape(self, name, type, ndims, shape) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_create_view_and_allocate_shape")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            integer(C_INT), value, intent(IN) :: type
            integer(C_INT), value, intent(IN) :: ndims
            integer(C_LONG), intent(IN) :: shape(*)
            type(C_PTR) :: rv
        end function c_datagroup_create_view_and_allocate_shape
        
        function c_datagroup_create_view_and_allocate_shape_bufferify(self, name, Lname, type, ndims, shape) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_create_view_and_allocate_shape_bufferify")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            integer(C_INT), value, intent(IN) :: Lname
            integer(C_INT), value, intent(IN) :: type
            integer(C_INT), value, intent(IN) :: ndims
            integer(C_LONG), intent(IN) :: shape(*)
            type(C_PTR) :: rv
        end function c_datagroup_create_view_and_allocate_shape_bufferify
        
        function c_datagroup_create_view_scalar_int(self, name, value) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_create_view_scalar_int")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            integer(C_INT), value, intent(IN) :: value
            type(C_PTR) :: rv
        end function c_datagroup_create_view_scalar_int
        
        function c_datagroup_create_view_scalar_int_bufferify(self, name, Lname, value) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_create_view_scalar_int_bufferify")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            integer(C_INT), value, intent(IN) :: Lname
            integer(C_INT), value, intent(IN) :: value
            type(C_PTR) :: rv
        end function c_datagroup_create_view_scalar_int_bufferify
        
        function c_datagroup_create_view_scalar_long(self, name, value) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_create_view_scalar_long")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            integer(C_LONG), value, intent(IN) :: value
            type(C_PTR) :: rv
        end function c_datagroup_create_view_scalar_long
        
        function c_datagroup_create_view_scalar_long_bufferify(self, name, Lname, value) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_create_view_scalar_long_bufferify")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            integer(C_INT), value, intent(IN) :: Lname
            integer(C_LONG), value, intent(IN) :: value
            type(C_PTR) :: rv
        end function c_datagroup_create_view_scalar_long_bufferify
        
        function c_datagroup_create_view_scalar_float(self, name, value) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_create_view_scalar_float")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            real(C_FLOAT), value, intent(IN) :: value
            type(C_PTR) :: rv
        end function c_datagroup_create_view_scalar_float
        
        function c_datagroup_create_view_scalar_float_bufferify(self, name, Lname, value) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_create_view_scalar_float_bufferify")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            integer(C_INT), value, intent(IN) :: Lname
            real(C_FLOAT), value, intent(IN) :: value
            type(C_PTR) :: rv
        end function c_datagroup_create_view_scalar_float_bufferify
        
        function c_datagroup_create_view_scalar_double(self, name, value) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_create_view_scalar_double")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            real(C_DOUBLE), value, intent(IN) :: value
            type(C_PTR) :: rv
        end function c_datagroup_create_view_scalar_double
        
        function c_datagroup_create_view_scalar_double_bufferify(self, name, Lname, value) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_create_view_scalar_double_bufferify")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            integer(C_INT), value, intent(IN) :: Lname
            real(C_DOUBLE), value, intent(IN) :: value
            type(C_PTR) :: rv
        end function c_datagroup_create_view_scalar_double_bufferify
        
        function c_datagroup_create_view_string(self, name, value) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_create_view_string")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            character(kind=C_CHAR), intent(IN) :: value(*)
            type(C_PTR) :: rv
        end function c_datagroup_create_view_string
        
        function c_datagroup_create_view_string_bufferify(self, name, Lname, value, Lvalue) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_create_view_string_bufferify")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            integer(C_INT), value, intent(IN) :: Lname
            character(kind=C_CHAR), intent(IN) :: value(*)
            integer(C_INT), value, intent(IN) :: Lvalue
            type(C_PTR) :: rv
        end function c_datagroup_create_view_string_bufferify
        
        function c_datagroup_create_view_empty(self, name) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_create_view_empty")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            type(C_PTR) :: rv
        end function c_datagroup_create_view_empty
        
        function c_datagroup_create_view_empty_bufferify(self, name, Lname) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_create_view_empty_bufferify")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            integer(C_INT), value, intent(IN) :: Lname
            type(C_PTR) :: rv
        end function c_datagroup_create_view_empty_bufferify
        
        function c_datagroup_create_view_from_type(self, name, type, num_elems) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_create_view_from_type")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            integer(C_INT), value, intent(IN) :: type
            integer(C_LONG), value, intent(IN) :: num_elems
            type(C_PTR) :: rv
        end function c_datagroup_create_view_from_type
        
        function c_datagroup_create_view_from_type_bufferify(self, name, Lname, type, num_elems) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_create_view_from_type_bufferify")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            integer(C_INT), value, intent(IN) :: Lname
            integer(C_INT), value, intent(IN) :: type
            integer(C_LONG), value, intent(IN) :: num_elems
            type(C_PTR) :: rv
        end function c_datagroup_create_view_from_type_bufferify
        
        function c_datagroup_create_view_from_type_and_buffer(self, name, type, num_elems, buff) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_create_view_from_type_and_buffer")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            integer(C_INT), value, intent(IN) :: type
            integer(C_LONG), value, intent(IN) :: num_elems
            type(C_PTR), value, intent(IN) :: buff
            type(C_PTR) :: rv
        end function c_datagroup_create_view_from_type_and_buffer
        
        function c_datagroup_create_view_from_type_and_buffer_bufferify(self, name, Lname, type, num_elems, buff) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_create_view_from_type_and_buffer_bufferify")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            integer(C_INT), value, intent(IN) :: Lname
            integer(C_INT), value, intent(IN) :: type
            integer(C_LONG), value, intent(IN) :: num_elems
            type(C_PTR), value, intent(IN) :: buff
            type(C_PTR) :: rv
        end function c_datagroup_create_view_from_type_and_buffer_bufferify
        
        function c_datagroup_create_view_from_type_external(self, name, type, num_elems, external_ptr) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_create_view_from_type_external")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            integer(C_INT), value, intent(IN) :: type
            integer(C_LONG), value, intent(IN) :: num_elems
            type(C_PTR), value, intent(IN) :: external_ptr
            type(C_PTR) :: rv
        end function c_datagroup_create_view_from_type_external
        
        function c_datagroup_create_view_from_type_external_bufferify(self, name, Lname, type, num_elems, external_ptr) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_create_view_from_type_external_bufferify")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            integer(C_INT), value, intent(IN) :: Lname
            integer(C_INT), value, intent(IN) :: type
            integer(C_LONG), value, intent(IN) :: num_elems
            type(C_PTR), value, intent(IN) :: external_ptr
            type(C_PTR) :: rv
        end function c_datagroup_create_view_from_type_external_bufferify
        
        function c_datagroup_create_view_from_shape(self, name, type, ndims, shape) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_create_view_from_shape")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            integer(C_INT), value, intent(IN) :: type
            integer(C_INT), value, intent(IN) :: ndims
            integer(C_LONG), intent(IN) :: shape(*)
            type(C_PTR) :: rv
        end function c_datagroup_create_view_from_shape
        
        function c_datagroup_create_view_from_shape_bufferify(self, name, Lname, type, ndims, shape) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_create_view_from_shape_bufferify")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            integer(C_INT), value, intent(IN) :: Lname
            integer(C_INT), value, intent(IN) :: type
            integer(C_INT), value, intent(IN) :: ndims
            integer(C_LONG), intent(IN) :: shape(*)
            type(C_PTR) :: rv
        end function c_datagroup_create_view_from_shape_bufferify
        
        function c_datagroup_create_view_from_shape_and_buffer(self, name, type, ndims, shape, buff) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_create_view_from_shape_and_buffer")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            integer(C_INT), value, intent(IN) :: type
            integer(C_INT), value, intent(IN) :: ndims
            integer(C_LONG), intent(IN) :: shape(*)
            type(C_PTR), value, intent(IN) :: buff
            type(C_PTR) :: rv
        end function c_datagroup_create_view_from_shape_and_buffer
        
        function c_datagroup_create_view_from_shape_and_buffer_bufferify(self, name, Lname, type, ndims, shape, buff) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_create_view_from_shape_and_buffer_bufferify")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            integer(C_INT), value, intent(IN) :: Lname
            integer(C_INT), value, intent(IN) :: type
            integer(C_INT), value, intent(IN) :: ndims
            integer(C_LONG), intent(IN) :: shape(*)
            type(C_PTR), value, intent(IN) :: buff
            type(C_PTR) :: rv
        end function c_datagroup_create_view_from_shape_and_buffer_bufferify
        
        function c_datagroup_create_view_from_shape_external(self, name, type, ndims, shape, external_ptr) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_create_view_from_shape_external")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            integer(C_INT), value, intent(IN) :: type
            integer(C_INT), value, intent(IN) :: ndims
            integer(C_LONG), intent(IN) :: shape(*)
            type(C_PTR), value, intent(IN) :: external_ptr
            type(C_PTR) :: rv
        end function c_datagroup_create_view_from_shape_external
        
        function c_datagroup_create_view_from_shape_external_bufferify(self, name, Lname, type, ndims, shape, external_ptr) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_create_view_from_shape_external_bufferify")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            integer(C_INT), value, intent(IN) :: Lname
            integer(C_INT), value, intent(IN) :: type
            integer(C_INT), value, intent(IN) :: ndims
            integer(C_LONG), intent(IN) :: shape(*)
            type(C_PTR), value, intent(IN) :: external_ptr
            type(C_PTR) :: rv
        end function c_datagroup_create_view_from_shape_external_bufferify
        
        function c_datagroup_create_view_into_buffer(self, name, buff) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_create_view_into_buffer")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            type(C_PTR), value, intent(IN) :: buff
            type(C_PTR) :: rv
        end function c_datagroup_create_view_into_buffer
        
        function c_datagroup_create_view_into_buffer_bufferify(self, name, Lname, buff) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_create_view_into_buffer_bufferify")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            integer(C_INT), value, intent(IN) :: Lname
            type(C_PTR), value, intent(IN) :: buff
            type(C_PTR) :: rv
        end function c_datagroup_create_view_into_buffer_bufferify
        
        function c_datagroup_create_view_external(self, name, external_ptr) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_create_view_external")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            type(C_PTR), value, intent(IN) :: external_ptr
            type(C_PTR) :: rv
        end function c_datagroup_create_view_external
        
        function c_datagroup_create_view_external_bufferify(self, name, Lname, external_ptr) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_create_view_external_bufferify")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            integer(C_INT), value, intent(IN) :: Lname
            type(C_PTR), value, intent(IN) :: external_ptr
            type(C_PTR) :: rv
        end function c_datagroup_create_view_external_bufferify
        
        subroutine c_datagroup_destroy_view(self, name) &
                bind(C, name="SIDRE_datagroup_destroy_view")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
        end subroutine c_datagroup_destroy_view
        
        subroutine c_datagroup_destroy_view_bufferify(self, name, Lname) &
                bind(C, name="SIDRE_datagroup_destroy_view_bufferify")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            integer(C_INT), value, intent(IN) :: Lname
        end subroutine c_datagroup_destroy_view_bufferify
        
        subroutine c_datagroup_destroy_view_and_data_name(self, name) &
                bind(C, name="SIDRE_datagroup_destroy_view_and_data_name")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
        end subroutine c_datagroup_destroy_view_and_data_name
        
        subroutine c_datagroup_destroy_view_and_data_name_bufferify(self, name, Lname) &
                bind(C, name="SIDRE_datagroup_destroy_view_and_data_name_bufferify")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            integer(C_INT), value, intent(IN) :: Lname
        end subroutine c_datagroup_destroy_view_and_data_name_bufferify
        
        subroutine c_datagroup_destroy_view_and_data_index(self, idx) &
                bind(C, name="SIDRE_datagroup_destroy_view_and_data_index")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            integer(C_INT), value, intent(IN) :: idx
        end subroutine c_datagroup_destroy_view_and_data_index
        
        function c_datagroup_move_view(self, view) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_move_view")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            type(C_PTR), value, intent(IN) :: view
            type(C_PTR) :: rv
        end function c_datagroup_move_view
        
        function c_datagroup_copy_view(self, view) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_copy_view")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            type(C_PTR), value, intent(IN) :: view
            type(C_PTR) :: rv
        end function c_datagroup_copy_view
        
        function c_datagroup_has_group(self, name) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_has_group")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            logical(C_BOOL) :: rv
        end function c_datagroup_has_group
        
        function c_datagroup_has_group_bufferify(self, name, Lname) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_has_group_bufferify")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            integer(C_INT), value, intent(IN) :: Lname
            logical(C_BOOL) :: rv
        end function c_datagroup_has_group_bufferify
        
        function c_datagroup_get_group(self, name) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_get_group")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            type(C_PTR) :: rv
        end function c_datagroup_get_group
        
        function c_datagroup_get_group_bufferify(self, name, Lname) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_get_group_bufferify")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            integer(C_INT), value, intent(IN) :: Lname
            type(C_PTR) :: rv
        end function c_datagroup_get_group_bufferify
        
        pure function c_datagroup_get_group_index(self, name) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_get_group_index")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            integer(C_INT) :: rv
        end function c_datagroup_get_group_index
        
        pure function c_datagroup_get_group_index_bufferify(self, name, Lname) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_get_group_index_bufferify")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            integer(C_INT), value, intent(IN) :: Lname
            integer(C_INT) :: rv
        end function c_datagroup_get_group_index_bufferify
        
        pure function c_datagroup_get_group_name(self, idx) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_get_group_name")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            integer(C_INT), value, intent(IN) :: idx
            type(C_PTR) rv
        end function c_datagroup_get_group_name
        
        subroutine c_datagroup_get_group_name_bufferify(self, idx, SH_F_rv, LSH_F_rv) &
                bind(C, name="SIDRE_datagroup_get_group_name_bufferify")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            integer(C_INT), value, intent(IN) :: idx
            character(kind=C_CHAR), intent(OUT) :: SH_F_rv(*)
            integer(C_INT), value, intent(IN) :: LSH_F_rv
        end subroutine c_datagroup_get_group_name_bufferify
        
        pure function c_datagroup_get_first_valid_group_index(self) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_get_first_valid_group_index")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            integer(C_INT) :: rv
        end function c_datagroup_get_first_valid_group_index
        
        pure function c_datagroup_get_next_valid_group_index(self, idx) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_get_next_valid_group_index")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            integer(C_INT), value, intent(IN) :: idx
            integer(C_INT) :: rv
        end function c_datagroup_get_next_valid_group_index
        
        function c_datagroup_create_group(self, name) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_create_group")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            type(C_PTR) :: rv
        end function c_datagroup_create_group
        
        function c_datagroup_create_group_bufferify(self, name, Lname) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_create_group_bufferify")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            integer(C_INT), value, intent(IN) :: Lname
            type(C_PTR) :: rv
        end function c_datagroup_create_group_bufferify
        
        subroutine c_datagroup_destroy_group_name(self, name) &
                bind(C, name="SIDRE_datagroup_destroy_group_name")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
        end subroutine c_datagroup_destroy_group_name
        
        subroutine c_datagroup_destroy_group_name_bufferify(self, name, Lname) &
                bind(C, name="SIDRE_datagroup_destroy_group_name_bufferify")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(IN) :: name(*)
            integer(C_INT), value, intent(IN) :: Lname
        end subroutine c_datagroup_destroy_group_name_bufferify
        
        subroutine c_datagroup_destroy_group_index(self, idx) &
                bind(C, name="SIDRE_datagroup_destroy_group_index")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            integer(C_INT), value, intent(IN) :: idx
        end subroutine c_datagroup_destroy_group_index
        
        function c_datagroup_move_group(self, grp) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_move_group")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            type(C_PTR), value, intent(IN) :: grp
            type(C_PTR) :: rv
        end function c_datagroup_move_group
        
        subroutine c_datagroup_print(self) &
                bind(C, name="SIDRE_datagroup_print")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
        end subroutine c_datagroup_print
        
        pure function c_datagroup_is_equivalent_to(self, other) &
                result(rv) &
                bind(C, name="SIDRE_datagroup_is_equivalent_to")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            type(C_PTR), value, intent(IN) :: other
            logical(C_BOOL) :: rv
        end function c_datagroup_is_equivalent_to
        
        ! splicer begin class.DataGroup.additional_interfaces
        ! splicer end class.DataGroup.additional_interfaces
        
        pure function c_databuffer_get_index(self) &
                result(rv) &
                bind(C, name="SIDRE_databuffer_get_index")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            integer(C_INT) :: rv
        end function c_databuffer_get_index
        
        pure function c_databuffer_get_num_views(self) &
                result(rv) &
                bind(C, name="SIDRE_databuffer_get_num_views")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            integer(C_SIZE_T) :: rv
        end function c_databuffer_get_num_views
        
        subroutine c_databuffer_describe(self, type, num_elems) &
                bind(C, name="SIDRE_databuffer_describe")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            integer(C_INT), value, intent(IN) :: type
            integer(C_LONG), value, intent(IN) :: num_elems
        end subroutine c_databuffer_describe
        
        subroutine c_databuffer_allocate_existing(self) &
                bind(C, name="SIDRE_databuffer_allocate_existing")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
        end subroutine c_databuffer_allocate_existing
        
        subroutine c_databuffer_allocate_from_type(self, type, num_elems) &
                bind(C, name="SIDRE_databuffer_allocate_from_type")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            integer(C_INT), value, intent(IN) :: type
            integer(C_LONG), value, intent(IN) :: num_elems
        end subroutine c_databuffer_allocate_from_type
        
        subroutine c_databuffer_reallocate(self, num_elems) &
                bind(C, name="SIDRE_databuffer_reallocate")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            integer(C_LONG), value, intent(IN) :: num_elems
        end subroutine c_databuffer_reallocate
        
        function c_databuffer_get_void_ptr(self) &
                result(rv) &
                bind(C, name="SIDRE_databuffer_get_void_ptr")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            type(C_PTR) :: rv
        end function c_databuffer_get_void_ptr
        
        pure function c_databuffer_get_type_id(self) &
                result(rv) &
                bind(C, name="SIDRE_databuffer_get_type_id")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            integer(C_INT) :: rv
        end function c_databuffer_get_type_id
        
        pure function c_databuffer_get_num_elements(self) &
                result(rv) &
                bind(C, name="SIDRE_databuffer_get_num_elements")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            integer(C_SIZE_T) :: rv
        end function c_databuffer_get_num_elements
        
        pure function c_databuffer_get_total_bytes(self) &
                result(rv) &
                bind(C, name="SIDRE_databuffer_get_total_bytes")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            integer(C_SIZE_T) :: rv
        end function c_databuffer_get_total_bytes
        
        subroutine c_databuffer_print(self) &
                bind(C, name="SIDRE_databuffer_print")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
        end subroutine c_databuffer_print
        
        ! splicer begin class.DataBuffer.additional_interfaces
        ! splicer end class.DataBuffer.additional_interfaces
        
        subroutine c_dataview_allocate_simple(self) &
                bind(C, name="SIDRE_dataview_allocate_simple")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
        end subroutine c_dataview_allocate_simple
        
        subroutine c_dataview_allocate_from_type(self, type, num_elems) &
                bind(C, name="SIDRE_dataview_allocate_from_type")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            integer(C_INT), value, intent(IN) :: type
            integer(C_LONG), value, intent(IN) :: num_elems
        end subroutine c_dataview_allocate_from_type
        
        subroutine c_dataview_reallocate(self, num_elems) &
                bind(C, name="SIDRE_dataview_reallocate")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            integer(C_LONG), value, intent(IN) :: num_elems
        end subroutine c_dataview_reallocate
        
        subroutine c_dataview_apply_0(self) &
                bind(C, name="SIDRE_dataview_apply_0")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
        end subroutine c_dataview_apply_0
        
        subroutine c_dataview_attach_buffer_only(self, buff) &
                bind(C, name="SIDRE_dataview_attach_buffer_only")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            type(C_PTR), value, intent(IN) :: buff
        end subroutine c_dataview_attach_buffer_only
        
        subroutine c_dataview_attach_buffer_type(self, type, num_elems, buff) &
                bind(C, name="SIDRE_dataview_attach_buffer_type")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            integer(C_INT), value, intent(IN) :: type
            integer(C_LONG), value, intent(IN) :: num_elems
            type(C_PTR), value, intent(IN) :: buff
        end subroutine c_dataview_attach_buffer_type
        
        subroutine c_dataview_attach_buffer_shape(self, type, ndims, shape, buff) &
                bind(C, name="SIDRE_dataview_attach_buffer_shape")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            integer(C_INT), value, intent(IN) :: type
            integer(C_INT), value, intent(IN) :: ndims
            integer(C_LONG), intent(IN) :: shape(*)
            type(C_PTR), value, intent(IN) :: buff
        end subroutine c_dataview_attach_buffer_shape
        
        subroutine c_dataview_apply_nelems(self, num_elems) &
                bind(C, name="SIDRE_dataview_apply_nelems")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            integer(C_LONG), value, intent(IN) :: num_elems
        end subroutine c_dataview_apply_nelems
        
        subroutine c_dataview_apply_nelems_offset(self, num_elems, offset) &
                bind(C, name="SIDRE_dataview_apply_nelems_offset")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            integer(C_LONG), value, intent(IN) :: num_elems
            integer(C_LONG), value, intent(IN) :: offset
        end subroutine c_dataview_apply_nelems_offset
        
        subroutine c_dataview_apply_nelems_offset_stride(self, num_elems, offset, stride) &
                bind(C, name="SIDRE_dataview_apply_nelems_offset_stride")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            integer(C_LONG), value, intent(IN) :: num_elems
            integer(C_LONG), value, intent(IN) :: offset
            integer(C_LONG), value, intent(IN) :: stride
        end subroutine c_dataview_apply_nelems_offset_stride
        
        subroutine c_dataview_apply_type_nelems(self, type, num_elems) &
                bind(C, name="SIDRE_dataview_apply_type_nelems")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            integer(C_INT), value, intent(IN) :: type
            integer(C_LONG), value, intent(IN) :: num_elems
        end subroutine c_dataview_apply_type_nelems
        
        subroutine c_dataview_apply_type_nelems_offset(self, type, num_elems, offset) &
                bind(C, name="SIDRE_dataview_apply_type_nelems_offset")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            integer(C_INT), value, intent(IN) :: type
            integer(C_LONG), value, intent(IN) :: num_elems
            integer(C_LONG), value, intent(IN) :: offset
        end subroutine c_dataview_apply_type_nelems_offset
        
        subroutine c_dataview_apply_type_nelems_offset_stride(self, type, num_elems, offset, stride) &
                bind(C, name="SIDRE_dataview_apply_type_nelems_offset_stride")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            integer(C_INT), value, intent(IN) :: type
            integer(C_LONG), value, intent(IN) :: num_elems
            integer(C_LONG), value, intent(IN) :: offset
            integer(C_LONG), value, intent(IN) :: stride
        end subroutine c_dataview_apply_type_nelems_offset_stride
        
        subroutine c_dataview_apply_type_shape(self, type, ndims, shape) &
                bind(C, name="SIDRE_dataview_apply_type_shape")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            integer(C_INT), value, intent(IN) :: type
            integer(C_INT), value, intent(IN) :: ndims
            integer(C_LONG), intent(IN) :: shape(*)
        end subroutine c_dataview_apply_type_shape
        
        pure function c_dataview_has_buffer(self) &
                result(rv) &
                bind(C, name="SIDRE_dataview_has_buffer")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            logical(C_BOOL) :: rv
        end function c_dataview_has_buffer
        
        pure function c_dataview_is_external(self) &
                result(rv) &
                bind(C, name="SIDRE_dataview_is_external")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            logical(C_BOOL) :: rv
        end function c_dataview_is_external
        
        pure function c_dataview_is_applied(self) &
                result(rv) &
                bind(C, name="SIDRE_dataview_is_applied")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            logical(C_BOOL) :: rv
        end function c_dataview_is_applied
        
        pure function c_dataview_is_described(self) &
                result(rv) &
                bind(C, name="SIDRE_dataview_is_described")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            logical(C_BOOL) :: rv
        end function c_dataview_is_described
        
        pure function c_dataview_is_empty(self) &
                result(rv) &
                bind(C, name="SIDRE_dataview_is_empty")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            logical(C_BOOL) :: rv
        end function c_dataview_is_empty
        
        pure function c_dataview_is_opaque(self) &
                result(rv) &
                bind(C, name="SIDRE_dataview_is_opaque")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            logical(C_BOOL) :: rv
        end function c_dataview_is_opaque
        
        pure function c_dataview_get_name(self) &
                result(rv) &
                bind(C, name="SIDRE_dataview_get_name")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            type(C_PTR) rv
        end function c_dataview_get_name
        
        subroutine c_dataview_get_name_bufferify(self, SH_F_rv, LSH_F_rv) &
                bind(C, name="SIDRE_dataview_get_name_bufferify")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(OUT) :: SH_F_rv(*)
            integer(C_INT), value, intent(IN) :: LSH_F_rv
        end subroutine c_dataview_get_name_bufferify
        
        function c_dataview_get_buffer(self) &
                result(rv) &
                bind(C, name="SIDRE_dataview_get_buffer")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            type(C_PTR) :: rv
        end function c_dataview_get_buffer
        
        pure function c_dataview_get_void_ptr(self) &
                result(rv) &
                bind(C, name="SIDRE_dataview_get_void_ptr")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            type(C_PTR) :: rv
        end function c_dataview_get_void_ptr
        
        subroutine c_dataview_set_scalar_int(self, value) &
                bind(C, name="SIDRE_dataview_set_scalar_int")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            integer(C_INT), value, intent(IN) :: value
        end subroutine c_dataview_set_scalar_int
        
        subroutine c_dataview_set_scalar_long(self, value) &
                bind(C, name="SIDRE_dataview_set_scalar_long")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            integer(C_LONG), value, intent(IN) :: value
        end subroutine c_dataview_set_scalar_long
        
        subroutine c_dataview_set_scalar_float(self, value) &
                bind(C, name="SIDRE_dataview_set_scalar_float")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            real(C_FLOAT), value, intent(IN) :: value
        end subroutine c_dataview_set_scalar_float
        
        subroutine c_dataview_set_scalar_double(self, value) &
                bind(C, name="SIDRE_dataview_set_scalar_double")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            real(C_DOUBLE), value, intent(IN) :: value
        end subroutine c_dataview_set_scalar_double
        
        subroutine c_dataview_set_external_data_ptr_only(self, external_ptr) &
                bind(C, name="SIDRE_dataview_set_external_data_ptr_only")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            type(C_PTR), value, intent(IN) :: external_ptr
        end subroutine c_dataview_set_external_data_ptr_only
        
        subroutine c_dataview_set_external_data_ptr_type(self, type, num_elems, external_ptr) &
                bind(C, name="SIDRE_dataview_set_external_data_ptr_type")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            integer(C_INT), value, intent(IN) :: type
            integer(C_LONG), value, intent(IN) :: num_elems
            type(C_PTR), value, intent(IN) :: external_ptr
        end subroutine c_dataview_set_external_data_ptr_type
        
        subroutine c_dataview_set_external_data_ptr_shape(self, type, ndims, shape, external_ptr) &
                bind(C, name="SIDRE_dataview_set_external_data_ptr_shape")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            integer(C_INT), value, intent(IN) :: type
            integer(C_INT), value, intent(IN) :: ndims
            integer(C_LONG), intent(IN) :: shape(*)
            type(C_PTR), value, intent(IN) :: external_ptr
        end subroutine c_dataview_set_external_data_ptr_shape
        
        function c_dataview_get_string(self) &
                result(rv) &
                bind(C, name="SIDRE_dataview_get_string")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            type(C_PTR) rv
        end function c_dataview_get_string
        
        subroutine c_dataview_get_string_bufferify(self, name, Lname) &
                bind(C, name="SIDRE_dataview_get_string_bufferify")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            character(kind=C_CHAR), intent(OUT) :: name(*)
            integer(C_INT), value, intent(IN) :: Lname
        end subroutine c_dataview_get_string_bufferify
        
        function c_dataview_get_data_int(self) &
                result(rv) &
                bind(C, name="SIDRE_dataview_get_data_int")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            integer(C_INT) :: rv
        end function c_dataview_get_data_int
        
        function c_dataview_get_data_long(self) &
                result(rv) &
                bind(C, name="SIDRE_dataview_get_data_long")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            integer(C_LONG) :: rv
        end function c_dataview_get_data_long
        
        function c_dataview_get_data_float(self) &
                result(rv) &
                bind(C, name="SIDRE_dataview_get_data_float")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            real(C_FLOAT) :: rv
        end function c_dataview_get_data_float
        
        function c_dataview_get_data_double(self) &
                result(rv) &
                bind(C, name="SIDRE_dataview_get_data_double")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            real(C_DOUBLE) :: rv
        end function c_dataview_get_data_double
        
        function c_dataview_get_owning_group(self) &
                result(rv) &
                bind(C, name="SIDRE_dataview_get_owning_group")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            type(C_PTR) :: rv
        end function c_dataview_get_owning_group
        
        pure function c_dataview_get_type_id(self) &
                result(rv) &
                bind(C, name="SIDRE_dataview_get_type_id")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            integer(C_INT) :: rv
        end function c_dataview_get_type_id
        
        pure function c_dataview_get_total_bytes(self) &
                result(rv) &
                bind(C, name="SIDRE_dataview_get_total_bytes")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            integer(C_SIZE_T) :: rv
        end function c_dataview_get_total_bytes
        
        pure function c_dataview_get_num_elements(self) &
                result(rv) &
                bind(C, name="SIDRE_dataview_get_num_elements")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            integer(C_SIZE_T) :: rv
        end function c_dataview_get_num_elements
        
        pure function c_dataview_get_num_dimensions(self) &
                result(rv) &
                bind(C, name="SIDRE_dataview_get_num_dimensions")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            integer(C_INT) :: rv
        end function c_dataview_get_num_dimensions
        
        pure function c_dataview_get_shape(self, ndims, shape) &
                result(rv) &
                bind(C, name="SIDRE_dataview_get_shape")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
            integer(C_INT), value, intent(IN) :: ndims
            integer(C_LONG), intent(IN) :: shape(*)
            integer(C_INT) :: rv
        end function c_dataview_get_shape
        
        subroutine c_dataview_print(self) &
                bind(C, name="SIDRE_dataview_print")
            use iso_c_binding
            implicit none
            type(C_PTR), value, intent(IN) :: self
        end subroutine c_dataview_print
        
        ! splicer begin class.DataView.additional_interfaces
        ! splicer end class.DataView.additional_interfaces
        
        function c_name_is_valid(name) &
                result(rv) &
                bind(C, name="SIDRE_name_is_valid")
            use iso_c_binding
            implicit none
            character(kind=C_CHAR), intent(IN) :: name(*)
            logical(C_BOOL) :: rv
        end function c_name_is_valid
        
        ! splicer begin additional_interfaces
        function SIDRE_create_array_view(group, name, lname, addr, type, rank, extents) &
              result(rv) bind(C,name="SIDRE_create_array_view")
            use iso_c_binding
            import SIDRE_LENGTH
            type(C_PTR), value, intent(IN)     :: group
            character(kind=C_CHAR), intent(IN) :: name(*)
            integer(C_INT), value, intent(IN)  :: lname
            type(C_PTR), value,     intent(IN) :: addr
            integer(C_INT), value, intent(IN)  :: type
            integer(C_INT), value, intent(IN)  :: rank
            integer(SIDRE_LENGTH), intent(IN)  :: extents(*)
            type(C_PTR) rv
        end function SIDRE_create_array_view
        ! splicer end additional_interfaces
    end interface

contains
    
    function datastore_new() result(rv)
        implicit none
        type(datastore) :: rv
        ! splicer begin class.DataStore.method.new
        rv%voidptr = c_datastore_new()
        ! splicer end class.DataStore.method.new
    end function datastore_new
    
    subroutine datastore_delete(obj)
        use iso_c_binding, only : C_NULL_PTR
        implicit none
        class(datastore) :: obj
        ! splicer begin class.DataStore.method.delete
        call c_datastore_delete(obj%voidptr)
        obj%voidptr = C_NULL_PTR
        ! splicer end class.DataStore.method.delete
    end subroutine datastore_delete
    
    function datastore_get_root(obj) result(rv)
        implicit none
        class(datastore) :: obj
        type(datagroup) :: rv
        ! splicer begin class.DataStore.method.get_root
        rv%voidptr = c_datastore_get_root(obj%voidptr)
        ! splicer end class.DataStore.method.get_root
    end function datastore_get_root
    
    function datastore_get_buffer(obj, idx) result(rv)
        use iso_c_binding, only : C_INT
        implicit none
        class(datastore) :: obj
        integer(C_INT), value, intent(IN) :: idx
        type(databuffer) :: rv
        ! splicer begin class.DataStore.method.get_buffer
        rv%voidptr = c_datastore_get_buffer(  &
            obj%voidptr,  &
            idx)
        ! splicer end class.DataStore.method.get_buffer
    end function datastore_get_buffer
    
    function datastore_create_buffer_empty(obj) result(rv)
        implicit none
        class(datastore) :: obj
        type(databuffer) :: rv
        ! splicer begin class.DataStore.method.create_buffer_empty
        rv%voidptr = c_datastore_create_buffer_empty(obj%voidptr)
        ! splicer end class.DataStore.method.create_buffer_empty
    end function datastore_create_buffer_empty
    
    function datastore_create_buffer_from_type_int(obj, type, num_elems) result(rv)
        use iso_c_binding, only : C_LONG, C_INT
        implicit none
        class(datastore) :: obj
        integer(C_INT), value, intent(IN) :: type
        integer(C_INT), value, intent(IN) :: num_elems
        type(databuffer) :: rv
        ! splicer begin class.DataStore.method.create_buffer_from_type_int
        rv%voidptr = c_datastore_create_buffer_from_type(  &
            obj%voidptr,  &
            type,  &
            int(num_elems, C_LONG))
        ! splicer end class.DataStore.method.create_buffer_from_type_int
    end function datastore_create_buffer_from_type_int
    
    function datastore_create_buffer_from_type_long(obj, type, num_elems) result(rv)
        use iso_c_binding, only : C_LONG, C_INT
        implicit none
        class(datastore) :: obj
        integer(C_INT), value, intent(IN) :: type
        integer(C_LONG), value, intent(IN) :: num_elems
        type(databuffer) :: rv
        ! splicer begin class.DataStore.method.create_buffer_from_type_long
        rv%voidptr = c_datastore_create_buffer_from_type(  &
            obj%voidptr,  &
            type,  &
            int(num_elems, C_LONG))
        ! splicer end class.DataStore.method.create_buffer_from_type_long
    end function datastore_create_buffer_from_type_long
    
    subroutine datastore_destroy_buffer(obj, id)
        use iso_c_binding, only : C_INT
        implicit none
        class(datastore) :: obj
        integer(C_INT), value, intent(IN) :: id
        ! splicer begin class.DataStore.method.destroy_buffer
        call c_datastore_destroy_buffer(  &
            obj%voidptr,  &
            id)
        ! splicer end class.DataStore.method.destroy_buffer
    end subroutine datastore_destroy_buffer
    
    function datastore_get_num_buffers(obj) result(rv)
        use iso_c_binding, only : C_SIZE_T
        implicit none
        class(datastore) :: obj
        integer(C_SIZE_T) :: rv
        ! splicer begin class.DataStore.method.get_num_buffers
        rv = c_datastore_get_num_buffers(obj%voidptr)
        ! splicer end class.DataStore.method.get_num_buffers
    end function datastore_get_num_buffers
    
    subroutine datastore_print(obj)
        implicit none
        class(datastore) :: obj
        ! splicer begin class.DataStore.method.print
        call c_datastore_print(obj%voidptr)
        ! splicer end class.DataStore.method.print
    end subroutine datastore_print
    
    subroutine datastore_save_0(obj, file_path, protocol)
        use iso_c_binding, only : C_INT
        implicit none
        class(datastore) :: obj
        character(*), intent(IN) :: file_path
        character(*), intent(IN) :: protocol
        ! splicer begin class.DataStore.method.save_0
        call c_datastore_save_0_bufferify(  &
            obj%voidptr,  &
            file_path,  &
            len_trim(file_path, kind=C_INT),  &
            protocol,  &
            len_trim(protocol, kind=C_INT))
        ! splicer end class.DataStore.method.save_0
    end subroutine datastore_save_0
    
    subroutine datastore_save_1(obj, file_path, protocol, group)
        use iso_c_binding, only : C_INT
        implicit none
        class(datastore) :: obj
        character(*), intent(IN) :: file_path
        character(*), intent(IN) :: protocol
        type(datagroup), value, intent(IN) :: group
        ! splicer begin class.DataStore.method.save_1
        call c_datastore_save_1_bufferify(  &
            obj%voidptr,  &
            file_path,  &
            len_trim(file_path, kind=C_INT),  &
            protocol,  &
            len_trim(protocol, kind=C_INT),  &
            group%voidptr)
        ! splicer end class.DataStore.method.save_1
    end subroutine datastore_save_1
    
    subroutine datastore_load_0(obj, file_path, protocol)
        use iso_c_binding, only : C_INT
        implicit none
        class(datastore) :: obj
        character(*), intent(IN) :: file_path
        character(*), intent(IN) :: protocol
        ! splicer begin class.DataStore.method.load_0
        call c_datastore_load_0_bufferify(  &
            obj%voidptr,  &
            file_path,  &
            len_trim(file_path, kind=C_INT),  &
            protocol,  &
            len_trim(protocol, kind=C_INT))
        ! splicer end class.DataStore.method.load_0
    end subroutine datastore_load_0
    
    subroutine datastore_load_1(obj, file_path, protocol, group)
        use iso_c_binding, only : C_INT
        implicit none
        class(datastore) :: obj
        character(*), intent(IN) :: file_path
        character(*), intent(IN) :: protocol
        type(datagroup), value, intent(IN) :: group
        ! splicer begin class.DataStore.method.load_1
        call c_datastore_load_1_bufferify(  &
            obj%voidptr,  &
            file_path,  &
            len_trim(file_path, kind=C_INT),  &
            protocol,  &
            len_trim(protocol, kind=C_INT),  &
            group%voidptr)
        ! splicer end class.DataStore.method.load_1
    end subroutine datastore_load_1
    
    subroutine datastore_load_external_data_0(obj, file_path, protocol)
        use iso_c_binding, only : C_INT
        implicit none
        class(datastore) :: obj
        character(*), intent(IN) :: file_path
        character(*), intent(IN) :: protocol
        ! splicer begin class.DataStore.method.load_external_data_0
        call c_datastore_load_external_data_0_bufferify(  &
            obj%voidptr,  &
            file_path,  &
            len_trim(file_path, kind=C_INT),  &
            protocol,  &
            len_trim(protocol, kind=C_INT))
        ! splicer end class.DataStore.method.load_external_data_0
    end subroutine datastore_load_external_data_0
    
    subroutine datastore_load_external_data_1(obj, file_path, protocol, group)
        use iso_c_binding, only : C_INT
        implicit none
        class(datastore) :: obj
        character(*), intent(IN) :: file_path
        character(*), intent(IN) :: protocol
        type(datagroup), value, intent(IN) :: group
        ! splicer begin class.DataStore.method.load_external_data_1
        call c_datastore_load_external_data_1_bufferify(  &
            obj%voidptr,  &
            file_path,  &
            len_trim(file_path, kind=C_INT),  &
            protocol,  &
            len_trim(protocol, kind=C_INT),  &
            group%voidptr)
        ! splicer end class.DataStore.method.load_external_data_1
    end subroutine datastore_load_external_data_1
    
    function datastore_get_instance(obj) result (voidptr)
        use iso_c_binding, only: C_PTR
        implicit none
        class(datastore), intent(IN) :: obj
        type(C_PTR) :: voidptr
        voidptr = obj%voidptr
    end function datastore_get_instance
    
    subroutine datastore_set_instance(obj, voidptr)
        use iso_c_binding, only: C_PTR
        implicit none
        class(datastore), intent(INOUT) :: obj
        type(C_PTR), intent(IN) :: voidptr
        obj%voidptr = voidptr
    end subroutine datastore_set_instance
    
    function datastore_associated(obj) result (rv)
        use iso_c_binding, only: c_associated
        implicit none
        class(datastore), intent(IN) :: obj
        logical rv
        rv = c_associated(obj%voidptr)
    end function datastore_associated
    
    ! splicer begin class.DataStore.additional_functions
    ! splicer end class.DataStore.additional_functions
    
    function datagroup_get_name(obj) result(rv)
        use iso_c_binding, only : C_CHAR, C_INT
        implicit none
        class(datagroup) :: obj
        character(kind=C_CHAR, len=(MAXNAMESIZE)) :: rv
        ! splicer begin class.DataGroup.method.get_name
        call c_datagroup_get_name_bufferify(  &
            obj%voidptr,  &
            rv,  &
            len(rv, kind=C_INT))
        ! splicer end class.DataGroup.method.get_name
    end function datagroup_get_name
    
    function datagroup_get_parent(obj) result(rv)
        implicit none
        class(datagroup) :: obj
        type(datagroup) :: rv
        ! splicer begin class.DataGroup.method.get_parent
        rv%voidptr = c_datagroup_get_parent(obj%voidptr)
        ! splicer end class.DataGroup.method.get_parent
    end function datagroup_get_parent
    
    function datagroup_get_data_store(obj) result(rv)
        implicit none
        class(datagroup) :: obj
        type(datastore) :: rv
        ! splicer begin class.DataGroup.method.get_data_store
        rv%voidptr = c_datagroup_get_data_store(obj%voidptr)
        ! splicer end class.DataGroup.method.get_data_store
    end function datagroup_get_data_store
    
    function datagroup_get_num_views(obj) result(rv)
        use iso_c_binding, only : C_SIZE_T
        implicit none
        class(datagroup) :: obj
        integer(C_SIZE_T) :: rv
        ! splicer begin class.DataGroup.method.get_num_views
        rv = c_datagroup_get_num_views(obj%voidptr)
        ! splicer end class.DataGroup.method.get_num_views
    end function datagroup_get_num_views
    
    function datagroup_get_num_groups(obj) result(rv)
        use iso_c_binding, only : C_SIZE_T
        implicit none
        class(datagroup) :: obj
        integer(C_SIZE_T) :: rv
        ! splicer begin class.DataGroup.method.get_num_groups
        rv = c_datagroup_get_num_groups(obj%voidptr)
        ! splicer end class.DataGroup.method.get_num_groups
    end function datagroup_get_num_groups
    
    function datagroup_has_view(obj, name) result(rv)
        use iso_c_binding, only : C_BOOL, C_INT
        implicit none
        class(datagroup) :: obj
        character(*), intent(IN) :: name
        logical :: rv
        ! splicer begin class.DataGroup.method.has_view
        rv = c_datagroup_has_view_bufferify(  &
            obj%voidptr,  &
            name,  &
            len_trim(name, kind=C_INT))
        ! splicer end class.DataGroup.method.has_view
    end function datagroup_has_view
    
    function datagroup_get_view_from_name(obj, name) result(rv)
        use iso_c_binding, only : C_INT
        implicit none
        class(datagroup) :: obj
        character(*), intent(IN) :: name
        type(dataview) :: rv
        ! splicer begin class.DataGroup.method.get_view_from_name
        rv%voidptr = c_datagroup_get_view_from_name_bufferify(  &
            obj%voidptr,  &
            name,  &
            len_trim(name, kind=C_INT))
        ! splicer end class.DataGroup.method.get_view_from_name
    end function datagroup_get_view_from_name
    
    function datagroup_get_view_from_index(obj, idx) result(rv)
        use iso_c_binding, only : C_INT
        implicit none
        class(datagroup) :: obj
        integer(C_INT), value, intent(IN) :: idx
        type(dataview) :: rv
        ! splicer begin class.DataGroup.method.get_view_from_index
        rv%voidptr = c_datagroup_get_view_from_index(  &
            obj%voidptr,  &
            idx)
        ! splicer end class.DataGroup.method.get_view_from_index
    end function datagroup_get_view_from_index
    
    function datagroup_get_view_index(obj, name) result(rv)
        use iso_c_binding, only : C_INT
        implicit none
        class(datagroup) :: obj
        character(*), intent(IN) :: name
        integer(C_INT) :: rv
        ! splicer begin class.DataGroup.method.get_view_index
        rv = c_datagroup_get_view_index_bufferify(  &
            obj%voidptr,  &
            name,  &
            len_trim(name, kind=C_INT))
        ! splicer end class.DataGroup.method.get_view_index
    end function datagroup_get_view_index
    
    function datagroup_get_view_name(obj, idx) result(rv)
        use iso_c_binding, only : C_CHAR, C_INT
        implicit none
        class(datagroup) :: obj
        integer(C_INT), value, intent(IN) :: idx
        character(kind=C_CHAR, len=(MAXNAMESIZE)) :: rv
        ! splicer begin class.DataGroup.method.get_view_name
        call c_datagroup_get_view_name_bufferify(  &
            obj%voidptr,  &
            idx,  &
            rv,  &
            len(rv, kind=C_INT))
        ! splicer end class.DataGroup.method.get_view_name
    end function datagroup_get_view_name
    
    function datagroup_get_first_valid_view_index(obj) result(rv)
        use iso_c_binding, only : C_INT
        implicit none
        class(datagroup) :: obj
        integer(C_INT) :: rv
        ! splicer begin class.DataGroup.method.get_first_valid_view_index
        rv = c_datagroup_get_first_valid_view_index(obj%voidptr)
        ! splicer end class.DataGroup.method.get_first_valid_view_index
    end function datagroup_get_first_valid_view_index
    
    function datagroup_get_next_valid_view_index(obj, idx) result(rv)
        use iso_c_binding, only : C_INT
        implicit none
        class(datagroup) :: obj
        integer(C_INT), value, intent(IN) :: idx
        integer(C_INT) :: rv
        ! splicer begin class.DataGroup.method.get_next_valid_view_index
        rv = c_datagroup_get_next_valid_view_index(  &
            obj%voidptr,  &
            idx)
        ! splicer end class.DataGroup.method.get_next_valid_view_index
    end function datagroup_get_next_valid_view_index
    
    function datagroup_create_view_and_allocate_nelems_int(obj, name, type, num_elems) result(rv)
        use iso_c_binding, only : C_LONG, C_INT
        implicit none
        class(datagroup) :: obj
        character(*), intent(IN) :: name
        integer(C_INT), value, intent(IN) :: type
        integer(C_INT), value, intent(IN) :: num_elems
        type(dataview) :: rv
        ! splicer begin class.DataGroup.method.create_view_and_allocate_nelems_int
        rv%voidptr = c_datagroup_create_view_and_allocate_nelems_bufferify(  &
            obj%voidptr,  &
            name,  &
            len_trim(name, kind=C_INT),  &
            type,  &
            int(num_elems, C_LONG))
        ! splicer end class.DataGroup.method.create_view_and_allocate_nelems_int
    end function datagroup_create_view_and_allocate_nelems_int
    
    function datagroup_create_view_and_allocate_nelems_long(obj, name, type, num_elems) result(rv)
        use iso_c_binding, only : C_LONG, C_INT
        implicit none
        class(datagroup) :: obj
        character(*), intent(IN) :: name
        integer(C_INT), value, intent(IN) :: type
        integer(C_LONG), value, intent(IN) :: num_elems
        type(dataview) :: rv
        ! splicer begin class.DataGroup.method.create_view_and_allocate_nelems_long
        rv%voidptr = c_datagroup_create_view_and_allocate_nelems_bufferify(  &
            obj%voidptr,  &
            name,  &
            len_trim(name, kind=C_INT),  &
            type,  &
            int(num_elems, C_LONG))
        ! splicer end class.DataGroup.method.create_view_and_allocate_nelems_long
    end function datagroup_create_view_and_allocate_nelems_long
    
    function datagroup_create_view_and_allocate_shape(obj, name, type, ndims, shape) result(rv)
        use iso_c_binding, only : C_LONG, C_INT
        implicit none
        class(datagroup) :: obj
        character(*), intent(IN) :: name
        integer(C_INT), value, intent(IN) :: type
        integer(C_INT), value, intent(IN) :: ndims
        integer(C_LONG), intent(IN) :: shape(*)
        type(dataview) :: rv
        ! splicer begin class.DataGroup.method.create_view_and_allocate_shape
        rv%voidptr = c_datagroup_create_view_and_allocate_shape_bufferify(  &
            obj%voidptr,  &
            name,  &
            len_trim(name, kind=C_INT),  &
            type,  &
            ndims,  &
            shape)
        ! splicer end class.DataGroup.method.create_view_and_allocate_shape
    end function datagroup_create_view_and_allocate_shape
    
    function datagroup_create_view_scalar_int(obj, name, value) result(rv)
        use iso_c_binding, only : C_INT
        implicit none
        class(datagroup) :: obj
        character(*), intent(IN) :: name
        integer(C_INT), value, intent(IN) :: value
        type(dataview) :: rv
        ! splicer begin class.DataGroup.method.create_view_scalar_int
        rv%voidptr = c_datagroup_create_view_scalar_int_bufferify(  &
            obj%voidptr,  &
            name,  &
            len_trim(name, kind=C_INT),  &
            value)
        ! splicer end class.DataGroup.method.create_view_scalar_int
    end function datagroup_create_view_scalar_int
    
    function datagroup_create_view_scalar_long(obj, name, value) result(rv)
        use iso_c_binding, only : C_LONG, C_INT
        implicit none
        class(datagroup) :: obj
        character(*), intent(IN) :: name
        integer(C_LONG), value, intent(IN) :: value
        type(dataview) :: rv
        ! splicer begin class.DataGroup.method.create_view_scalar_long
        rv%voidptr = c_datagroup_create_view_scalar_long_bufferify(  &
            obj%voidptr,  &
            name,  &
            len_trim(name, kind=C_INT),  &
            value)
        ! splicer end class.DataGroup.method.create_view_scalar_long
    end function datagroup_create_view_scalar_long
    
    function datagroup_create_view_scalar_float(obj, name, value) result(rv)
        use iso_c_binding, only : C_INT, C_FLOAT
        implicit none
        class(datagroup) :: obj
        character(*), intent(IN) :: name
        real(C_FLOAT), value, intent(IN) :: value
        type(dataview) :: rv
        ! splicer begin class.DataGroup.method.create_view_scalar_float
        rv%voidptr = c_datagroup_create_view_scalar_float_bufferify(  &
            obj%voidptr,  &
            name,  &
            len_trim(name, kind=C_INT),  &
            value)
        ! splicer end class.DataGroup.method.create_view_scalar_float
    end function datagroup_create_view_scalar_float
    
    function datagroup_create_view_scalar_double(obj, name, value) result(rv)
        use iso_c_binding, only : C_INT, C_DOUBLE
        implicit none
        class(datagroup) :: obj
        character(*), intent(IN) :: name
        real(C_DOUBLE), value, intent(IN) :: value
        type(dataview) :: rv
        ! splicer begin class.DataGroup.method.create_view_scalar_double
        rv%voidptr = c_datagroup_create_view_scalar_double_bufferify(  &
            obj%voidptr,  &
            name,  &
            len_trim(name, kind=C_INT),  &
            value)
        ! splicer end class.DataGroup.method.create_view_scalar_double
    end function datagroup_create_view_scalar_double
    
    function datagroup_create_view_string(obj, name, value) result(rv)
        use iso_c_binding, only : C_INT
        implicit none
        class(datagroup) :: obj
        character(*), intent(IN) :: name
        character(*), intent(IN) :: value
        type(dataview) :: rv
        ! splicer begin class.DataGroup.method.create_view_string
        rv%voidptr = c_datagroup_create_view_string_bufferify(  &
            obj%voidptr,  &
            name,  &
            len_trim(name, kind=C_INT),  &
            value,  &
            len_trim(value, kind=C_INT))
        ! splicer end class.DataGroup.method.create_view_string
    end function datagroup_create_view_string
    
    function datagroup_create_view_empty(obj, name) result(rv)
        use iso_c_binding, only : C_INT
        implicit none
        class(datagroup) :: obj
        character(*), intent(IN) :: name
        type(dataview) :: rv
        ! splicer begin class.DataGroup.method.create_view_empty
        rv%voidptr = c_datagroup_create_view_empty_bufferify(  &
            obj%voidptr,  &
            name,  &
            len_trim(name, kind=C_INT))
        ! splicer end class.DataGroup.method.create_view_empty
    end function datagroup_create_view_empty
    
    function datagroup_create_view_from_type_int(obj, name, type, num_elems) result(rv)
        use iso_c_binding, only : C_LONG, C_INT
        implicit none
        class(datagroup) :: obj
        character(*), intent(IN) :: name
        integer(C_INT), value, intent(IN) :: type
        integer(C_INT), value, intent(IN) :: num_elems
        type(dataview) :: rv
        ! splicer begin class.DataGroup.method.create_view_from_type_int
        rv%voidptr = c_datagroup_create_view_from_type_bufferify(  &
            obj%voidptr,  &
            name,  &
            len_trim(name, kind=C_INT),  &
            type,  &
            int(num_elems, C_LONG))
        ! splicer end class.DataGroup.method.create_view_from_type_int
    end function datagroup_create_view_from_type_int
    
    function datagroup_create_view_from_type_long(obj, name, type, num_elems) result(rv)
        use iso_c_binding, only : C_LONG, C_INT
        implicit none
        class(datagroup) :: obj
        character(*), intent(IN) :: name
        integer(C_INT), value, intent(IN) :: type
        integer(C_LONG), value, intent(IN) :: num_elems
        type(dataview) :: rv
        ! splicer begin class.DataGroup.method.create_view_from_type_long
        rv%voidptr = c_datagroup_create_view_from_type_bufferify(  &
            obj%voidptr,  &
            name,  &
            len_trim(name, kind=C_INT),  &
            type,  &
            int(num_elems, C_LONG))
        ! splicer end class.DataGroup.method.create_view_from_type_long
    end function datagroup_create_view_from_type_long
    
    function datagroup_create_view_from_type_and_buffer_int(obj, name, type, num_elems, buff) result(rv)
        use iso_c_binding, only : C_LONG, C_INT
        implicit none
        class(datagroup) :: obj
        character(*), intent(IN) :: name
        integer(C_INT), value, intent(IN) :: type
        integer(C_INT), value, intent(IN) :: num_elems
        type(databuffer), value, intent(IN) :: buff
        type(dataview) :: rv
        ! splicer begin class.DataGroup.method.create_view_from_type_and_buffer_int
        rv%voidptr = c_datagroup_create_view_from_type_and_buffer_bufferify(  &
            obj%voidptr,  &
            name,  &
            len_trim(name, kind=C_INT),  &
            type,  &
            int(num_elems, C_LONG),  &
            buff%voidptr)
        ! splicer end class.DataGroup.method.create_view_from_type_and_buffer_int
    end function datagroup_create_view_from_type_and_buffer_int
    
    function datagroup_create_view_from_type_and_buffer_long(obj, name, type, num_elems, buff) result(rv)
        use iso_c_binding, only : C_LONG, C_INT
        implicit none
        class(datagroup) :: obj
        character(*), intent(IN) :: name
        integer(C_INT), value, intent(IN) :: type
        integer(C_LONG), value, intent(IN) :: num_elems
        type(databuffer), value, intent(IN) :: buff
        type(dataview) :: rv
        ! splicer begin class.DataGroup.method.create_view_from_type_and_buffer_long
        rv%voidptr = c_datagroup_create_view_from_type_and_buffer_bufferify(  &
            obj%voidptr,  &
            name,  &
            len_trim(name, kind=C_INT),  &
            type,  &
            int(num_elems, C_LONG),  &
            buff%voidptr)
        ! splicer end class.DataGroup.method.create_view_from_type_and_buffer_long
    end function datagroup_create_view_from_type_and_buffer_long
    
    function datagroup_create_view_from_type_external_int(obj, name, type, num_elems, external_ptr) result(rv)
        use iso_c_binding, only : C_LONG, C_INT
        implicit none
        class(datagroup) :: obj
        character(*), intent(IN) :: name
        integer(C_INT), value, intent(IN) :: type
        integer(C_INT), value, intent(IN) :: num_elems
        type(C_PTR), value, intent(IN) :: external_ptr
        type(dataview) :: rv
        ! splicer begin class.DataGroup.method.create_view_from_type_external_int
        rv%voidptr = c_datagroup_create_view_from_type_external_bufferify(  &
            obj%voidptr,  &
            name,  &
            len_trim(name, kind=C_INT),  &
            type,  &
            int(num_elems, C_LONG),  &
            external_ptr)
        ! splicer end class.DataGroup.method.create_view_from_type_external_int
    end function datagroup_create_view_from_type_external_int
    
    function datagroup_create_view_from_type_external_long(obj, name, type, num_elems, external_ptr) result(rv)
        use iso_c_binding, only : C_LONG, C_INT
        implicit none
        class(datagroup) :: obj
        character(*), intent(IN) :: name
        integer(C_INT), value, intent(IN) :: type
        integer(C_LONG), value, intent(IN) :: num_elems
        type(C_PTR), value, intent(IN) :: external_ptr
        type(dataview) :: rv
        ! splicer begin class.DataGroup.method.create_view_from_type_external_long
        rv%voidptr = c_datagroup_create_view_from_type_external_bufferify(  &
            obj%voidptr,  &
            name,  &
            len_trim(name, kind=C_INT),  &
            type,  &
            int(num_elems, C_LONG),  &
            external_ptr)
        ! splicer end class.DataGroup.method.create_view_from_type_external_long
    end function datagroup_create_view_from_type_external_long
    
    function datagroup_create_view_from_shape(obj, name, type, ndims, shape) result(rv)
        use iso_c_binding, only : C_LONG, C_INT
        implicit none
        class(datagroup) :: obj
        character(*), intent(IN) :: name
        integer(C_INT), value, intent(IN) :: type
        integer(C_INT), value, intent(IN) :: ndims
        integer(C_LONG), intent(IN) :: shape(*)
        type(dataview) :: rv
        ! splicer begin class.DataGroup.method.create_view_from_shape
        rv%voidptr = c_datagroup_create_view_from_shape_bufferify(  &
            obj%voidptr,  &
            name,  &
            len_trim(name, kind=C_INT),  &
            type,  &
            ndims,  &
            shape)
        ! splicer end class.DataGroup.method.create_view_from_shape
    end function datagroup_create_view_from_shape
    
    function datagroup_create_view_from_shape_and_buffer(obj, name, type, ndims, shape, buff) result(rv)
        use iso_c_binding, only : C_LONG, C_INT
        implicit none
        class(datagroup) :: obj
        character(*), intent(IN) :: name
        integer(C_INT), value, intent(IN) :: type
        integer(C_INT), value, intent(IN) :: ndims
        integer(C_LONG), intent(IN) :: shape(*)
        type(databuffer), value, intent(IN) :: buff
        type(dataview) :: rv
        ! splicer begin class.DataGroup.method.create_view_from_shape_and_buffer
        rv%voidptr = c_datagroup_create_view_from_shape_and_buffer_bufferify(  &
            obj%voidptr,  &
            name,  &
            len_trim(name, kind=C_INT),  &
            type,  &
            ndims,  &
            shape,  &
            buff%voidptr)
        ! splicer end class.DataGroup.method.create_view_from_shape_and_buffer
    end function datagroup_create_view_from_shape_and_buffer
    
    function datagroup_create_view_from_shape_external(obj, name, type, ndims, shape, external_ptr) result(rv)
        use iso_c_binding, only : C_LONG, C_INT
        implicit none
        class(datagroup) :: obj
        character(*), intent(IN) :: name
        integer(C_INT), value, intent(IN) :: type
        integer(C_INT), value, intent(IN) :: ndims
        integer(C_LONG), intent(IN) :: shape(*)
        type(C_PTR), value, intent(IN) :: external_ptr
        type(dataview) :: rv
        ! splicer begin class.DataGroup.method.create_view_from_shape_external
        rv%voidptr = c_datagroup_create_view_from_shape_external_bufferify(  &
            obj%voidptr,  &
            name,  &
            len_trim(name, kind=C_INT),  &
            type,  &
            ndims,  &
            shape,  &
            external_ptr)
        ! splicer end class.DataGroup.method.create_view_from_shape_external
    end function datagroup_create_view_from_shape_external
    
    function datagroup_create_view_into_buffer(obj, name, buff) result(rv)
        use iso_c_binding, only : C_INT
        implicit none
        class(datagroup) :: obj
        character(*), intent(IN) :: name
        type(databuffer), value, intent(IN) :: buff
        type(dataview) :: rv
        ! splicer begin class.DataGroup.method.create_view_into_buffer
        rv%voidptr = c_datagroup_create_view_into_buffer_bufferify(  &
            obj%voidptr,  &
            name,  &
            len_trim(name, kind=C_INT),  &
            buff%voidptr)
        ! splicer end class.DataGroup.method.create_view_into_buffer
    end function datagroup_create_view_into_buffer
    
    function datagroup_create_view_external(obj, name, external_ptr) result(rv)
        use iso_c_binding, only : C_INT
        implicit none
        class(datagroup) :: obj
        character(*), intent(IN) :: name
        type(C_PTR), value, intent(IN) :: external_ptr
        type(dataview) :: rv
        ! splicer begin class.DataGroup.method.create_view_external
        rv%voidptr = c_datagroup_create_view_external_bufferify(  &
            obj%voidptr,  &
            name,  &
            len_trim(name, kind=C_INT),  &
            external_ptr)
        ! splicer end class.DataGroup.method.create_view_external
    end function datagroup_create_view_external
    
    subroutine datagroup_destroy_view(obj, name)
        use iso_c_binding, only : C_INT
        implicit none
        class(datagroup) :: obj
        character(*), intent(IN) :: name
        ! splicer begin class.DataGroup.method.destroy_view
        call c_datagroup_destroy_view_bufferify(  &
            obj%voidptr,  &
            name,  &
            len_trim(name, kind=C_INT))
        ! splicer end class.DataGroup.method.destroy_view
    end subroutine datagroup_destroy_view
    
    subroutine datagroup_destroy_view_and_data_name(obj, name)
        use iso_c_binding, only : C_INT
        implicit none
        class(datagroup) :: obj
        character(*), intent(IN) :: name
        ! splicer begin class.DataGroup.method.destroy_view_and_data_name
        call c_datagroup_destroy_view_and_data_name_bufferify(  &
            obj%voidptr,  &
            name,  &
            len_trim(name, kind=C_INT))
        ! splicer end class.DataGroup.method.destroy_view_and_data_name
    end subroutine datagroup_destroy_view_and_data_name
    
    subroutine datagroup_destroy_view_and_data_index(obj, idx)
        use iso_c_binding, only : C_INT
        implicit none
        class(datagroup) :: obj
        integer(C_INT), value, intent(IN) :: idx
        ! splicer begin class.DataGroup.method.destroy_view_and_data_index
        call c_datagroup_destroy_view_and_data_index(  &
            obj%voidptr,  &
            idx)
        ! splicer end class.DataGroup.method.destroy_view_and_data_index
    end subroutine datagroup_destroy_view_and_data_index
    
    function datagroup_move_view(obj, view) result(rv)
        implicit none
        class(datagroup) :: obj
        type(dataview), value, intent(IN) :: view
        type(dataview) :: rv
        ! splicer begin class.DataGroup.method.move_view
        rv%voidptr = c_datagroup_move_view(  &
            obj%voidptr,  &
            view%voidptr)
        ! splicer end class.DataGroup.method.move_view
    end function datagroup_move_view
    
    function datagroup_copy_view(obj, view) result(rv)
        implicit none
        class(datagroup) :: obj
        type(dataview), value, intent(IN) :: view
        type(dataview) :: rv
        ! splicer begin class.DataGroup.method.copy_view
        rv%voidptr = c_datagroup_copy_view(  &
            obj%voidptr,  &
            view%voidptr)
        ! splicer end class.DataGroup.method.copy_view
    end function datagroup_copy_view
    
    function datagroup_has_group(obj, name) result(rv)
        use iso_c_binding, only : C_BOOL, C_INT
        implicit none
        class(datagroup) :: obj
        character(*), intent(IN) :: name
        logical :: rv
        ! splicer begin class.DataGroup.method.has_group
        rv = c_datagroup_has_group_bufferify(  &
            obj%voidptr,  &
            name,  &
            len_trim(name, kind=C_INT))
        ! splicer end class.DataGroup.method.has_group
    end function datagroup_has_group
    
    function datagroup_get_group(obj, name) result(rv)
        use iso_c_binding, only : C_INT
        implicit none
        class(datagroup) :: obj
        character(*), intent(IN) :: name
        type(datagroup) :: rv
        ! splicer begin class.DataGroup.method.get_group
        rv%voidptr = c_datagroup_get_group_bufferify(  &
            obj%voidptr,  &
            name,  &
            len_trim(name, kind=C_INT))
        ! splicer end class.DataGroup.method.get_group
    end function datagroup_get_group
    
    function datagroup_get_group_index(obj, name) result(rv)
        use iso_c_binding, only : C_INT
        implicit none
        class(datagroup) :: obj
        character(*), intent(IN) :: name
        integer(C_INT) :: rv
        ! splicer begin class.DataGroup.method.get_group_index
        rv = c_datagroup_get_group_index_bufferify(  &
            obj%voidptr,  &
            name,  &
            len_trim(name, kind=C_INT))
        ! splicer end class.DataGroup.method.get_group_index
    end function datagroup_get_group_index
    
    function datagroup_get_group_name(obj, idx) result(rv)
        use iso_c_binding, only : C_CHAR, C_INT
        implicit none
        class(datagroup) :: obj
        integer(C_INT), value, intent(IN) :: idx
        character(kind=C_CHAR, len=(MAXNAMESIZE)) :: rv
        ! splicer begin class.DataGroup.method.get_group_name
        call c_datagroup_get_group_name_bufferify(  &
            obj%voidptr,  &
            idx,  &
            rv,  &
            len(rv, kind=C_INT))
        ! splicer end class.DataGroup.method.get_group_name
    end function datagroup_get_group_name
    
    function datagroup_get_first_valid_group_index(obj) result(rv)
        use iso_c_binding, only : C_INT
        implicit none
        class(datagroup) :: obj
        integer(C_INT) :: rv
        ! splicer begin class.DataGroup.method.get_first_valid_group_index
        rv = c_datagroup_get_first_valid_group_index(obj%voidptr)
        ! splicer end class.DataGroup.method.get_first_valid_group_index
    end function datagroup_get_first_valid_group_index
    
    function datagroup_get_next_valid_group_index(obj, idx) result(rv)
        use iso_c_binding, only : C_INT
        implicit none
        class(datagroup) :: obj
        integer(C_INT), value, intent(IN) :: idx
        integer(C_INT) :: rv
        ! splicer begin class.DataGroup.method.get_next_valid_group_index
        rv = c_datagroup_get_next_valid_group_index(  &
            obj%voidptr,  &
            idx)
        ! splicer end class.DataGroup.method.get_next_valid_group_index
    end function datagroup_get_next_valid_group_index
    
    function datagroup_create_group(obj, name) result(rv)
        use iso_c_binding, only : C_INT
        implicit none
        class(datagroup) :: obj
        character(*), intent(IN) :: name
        type(datagroup) :: rv
        ! splicer begin class.DataGroup.method.create_group
        rv%voidptr = c_datagroup_create_group_bufferify(  &
            obj%voidptr,  &
            name,  &
            len_trim(name, kind=C_INT))
        ! splicer end class.DataGroup.method.create_group
    end function datagroup_create_group
    
    subroutine datagroup_destroy_group_name(obj, name)
        use iso_c_binding, only : C_INT
        implicit none
        class(datagroup) :: obj
        character(*), intent(IN) :: name
        ! splicer begin class.DataGroup.method.destroy_group_name
        call c_datagroup_destroy_group_name_bufferify(  &
            obj%voidptr,  &
            name,  &
            len_trim(name, kind=C_INT))
        ! splicer end class.DataGroup.method.destroy_group_name
    end subroutine datagroup_destroy_group_name
    
    subroutine datagroup_destroy_group_index(obj, idx)
        use iso_c_binding, only : C_INT
        implicit none
        class(datagroup) :: obj
        integer(C_INT), value, intent(IN) :: idx
        ! splicer begin class.DataGroup.method.destroy_group_index
        call c_datagroup_destroy_group_index(  &
            obj%voidptr,  &
            idx)
        ! splicer end class.DataGroup.method.destroy_group_index
    end subroutine datagroup_destroy_group_index
    
    function datagroup_move_group(obj, grp) result(rv)
        implicit none
        class(datagroup) :: obj
        type(datagroup), value, intent(IN) :: grp
        type(datagroup) :: rv
        ! splicer begin class.DataGroup.method.move_group
        rv%voidptr = c_datagroup_move_group(  &
            obj%voidptr,  &
            grp%voidptr)
        ! splicer end class.DataGroup.method.move_group
    end function datagroup_move_group
    
    subroutine datagroup_print(obj)
        implicit none
        class(datagroup) :: obj
        ! splicer begin class.DataGroup.method.print
        call c_datagroup_print(obj%voidptr)
        ! splicer end class.DataGroup.method.print
    end subroutine datagroup_print
    
    function datagroup_is_equivalent_to(obj, other) result(rv)
        use iso_c_binding, only : C_BOOL
        implicit none
        class(datagroup) :: obj
        type(datagroup), value, intent(IN) :: other
        logical :: rv
        ! splicer begin class.DataGroup.method.is_equivalent_to
        rv = c_datagroup_is_equivalent_to(  &
            obj%voidptr,  &
            other%voidptr)
        ! splicer end class.DataGroup.method.is_equivalent_to
    end function datagroup_is_equivalent_to
    
    function datagroup_get_instance(obj) result (voidptr)
        use iso_c_binding, only: C_PTR
        implicit none
        class(datagroup), intent(IN) :: obj
        type(C_PTR) :: voidptr
        voidptr = obj%voidptr
    end function datagroup_get_instance
    
    subroutine datagroup_set_instance(obj, voidptr)
        use iso_c_binding, only: C_PTR
        implicit none
        class(datagroup), intent(INOUT) :: obj
        type(C_PTR), intent(IN) :: voidptr
        obj%voidptr = voidptr
    end subroutine datagroup_set_instance
    
    function datagroup_associated(obj) result (rv)
        use iso_c_binding, only: c_associated
        implicit none
        class(datagroup), intent(IN) :: obj
        logical rv
        rv = c_associated(obj%voidptr)
    end function datagroup_associated
    
    ! splicer begin class.DataGroup.additional_functions
    
    ! Generated by genfsidresplicer.py
    function datagroup_create_array_view_int_scalar(group, name, value) result(rv)
        use iso_c_binding
        implicit none
    
        class(datagroup), intent(IN) :: group
        character(*), intent(IN) :: name
        integer(C_INT), target, intent(IN) :: value
        integer(C_INT) :: lname
        type(dataview) :: rv
        integer(SIDRE_LENGTH) :: extents(1)
        integer(C_INT), parameter :: type = SIDRE_INT_ID
        type(C_PTR) addr
    
        lname = len_trim(name)
        call SHROUD_C_LOC(value, addr)
        if (c_associated(addr)) then
          extents(1) = 1_SIDRE_LENGTH
          rv%voidptr = c_datagroup_create_view_external_bufferify( &
              group%voidptr, name, lname, addr)
          call c_dataview_apply_type_shape(rv%voidptr, type, 0, extents)
        else
          rv%voidptr = c_datagroup_create_view_from_type_bufferify( &
              group%voidptr, name, lname, type, 0_C_LONG)
        endif
    end function datagroup_create_array_view_int_scalar
    
    ! Generated by genfsidresplicer.py
    function datagroup_create_array_view_int_1d(group, name, value) result(rv)
        use iso_c_binding
        implicit none
    
        class(datagroup), intent(IN) :: group
        character(*), intent(IN) :: name
        integer(C_INT), target, intent(IN) :: value(:)
        integer(C_INT) :: lname
        type(dataview) :: rv
        integer(SIDRE_LENGTH) :: extents(1)
        integer(C_INT), parameter :: type = SIDRE_INT_ID
        type(C_PTR) addr
    
        lname = len_trim(name)
        call SHROUD_C_LOC(value, addr)
        if (c_associated(addr)) then
          extents = shape(value, kind=SIDRE_LENGTH)
          rv%voidptr = c_datagroup_create_view_external_bufferify( &
              group%voidptr, name, lname, addr)
          call c_dataview_apply_type_shape(rv%voidptr, type, 1, extents)
        else
          rv%voidptr = c_datagroup_create_view_from_type_bufferify( &
              group%voidptr, name, lname, type, 0_C_LONG)
        endif
    end function datagroup_create_array_view_int_1d
    
    ! Generated by genfsidresplicer.py
    function datagroup_create_array_view_int_2d(group, name, value) result(rv)
        use iso_c_binding
        implicit none
    
        class(datagroup), intent(IN) :: group
        character(*), intent(IN) :: name
        integer(C_INT), target, intent(IN) :: value(:,:)
        integer(C_INT) :: lname
        type(dataview) :: rv
        integer(SIDRE_LENGTH) :: extents(2)
        integer(C_INT), parameter :: type = SIDRE_INT_ID
        type(C_PTR) addr
    
        lname = len_trim(name)
        call SHROUD_C_LOC(value, addr)
        if (c_associated(addr)) then
          extents = shape(value, kind=SIDRE_LENGTH)
          rv%voidptr = c_datagroup_create_view_external_bufferify( &
              group%voidptr, name, lname, addr)
          call c_dataview_apply_type_shape(rv%voidptr, type, 2, extents)
        else
          rv%voidptr = c_datagroup_create_view_from_type_bufferify( &
              group%voidptr, name, lname, type, 0_C_LONG)
        endif
    end function datagroup_create_array_view_int_2d
    
    ! Generated by genfsidresplicer.py
    function datagroup_create_array_view_int_3d(group, name, value) result(rv)
        use iso_c_binding
        implicit none
    
        class(datagroup), intent(IN) :: group
        character(*), intent(IN) :: name
        integer(C_INT), target, intent(IN) :: value(:,:,:)
        integer(C_INT) :: lname
        type(dataview) :: rv
        integer(SIDRE_LENGTH) :: extents(3)
        integer(C_INT), parameter :: type = SIDRE_INT_ID
        type(C_PTR) addr
    
        lname = len_trim(name)
        call SHROUD_C_LOC(value, addr)
        if (c_associated(addr)) then
          extents = shape(value, kind=SIDRE_LENGTH)
          rv%voidptr = c_datagroup_create_view_external_bufferify( &
              group%voidptr, name, lname, addr)
          call c_dataview_apply_type_shape(rv%voidptr, type, 3, extents)
        else
          rv%voidptr = c_datagroup_create_view_from_type_bufferify( &
              group%voidptr, name, lname, type, 0_C_LONG)
        endif
    end function datagroup_create_array_view_int_3d
    
    ! Generated by genfsidresplicer.py
    function datagroup_create_array_view_int_4d(group, name, value) result(rv)
        use iso_c_binding
        implicit none
    
        class(datagroup), intent(IN) :: group
        character(*), intent(IN) :: name
        integer(C_INT), target, intent(IN) :: value(:,:,:,:)
        integer(C_INT) :: lname
        type(dataview) :: rv
        integer(SIDRE_LENGTH) :: extents(4)
        integer(C_INT), parameter :: type = SIDRE_INT_ID
        type(C_PTR) addr
    
        lname = len_trim(name)
        call SHROUD_C_LOC(value, addr)
        if (c_associated(addr)) then
          extents = shape(value, kind=SIDRE_LENGTH)
          rv%voidptr = c_datagroup_create_view_external_bufferify( &
              group%voidptr, name, lname, addr)
          call c_dataview_apply_type_shape(rv%voidptr, type, 4, extents)
        else
          rv%voidptr = c_datagroup_create_view_from_type_bufferify( &
              group%voidptr, name, lname, type, 0_C_LONG)
        endif
    end function datagroup_create_array_view_int_4d
    
    ! Generated by genfsidresplicer.py
    function datagroup_create_array_view_long_scalar(group, name, value) result(rv)
        use iso_c_binding
        implicit none
    
        class(datagroup), intent(IN) :: group
        character(*), intent(IN) :: name
        integer(C_LONG), target, intent(IN) :: value
        integer(C_INT) :: lname
        type(dataview) :: rv
        integer(SIDRE_LENGTH) :: extents(1)
        integer(C_INT), parameter :: type = SIDRE_LONG_ID
        type(C_PTR) addr
    
        lname = len_trim(name)
        call SHROUD_C_LOC(value, addr)
        if (c_associated(addr)) then
          extents(1) = 1_SIDRE_LENGTH
          rv%voidptr = c_datagroup_create_view_external_bufferify( &
              group%voidptr, name, lname, addr)
          call c_dataview_apply_type_shape(rv%voidptr, type, 0, extents)
        else
          rv%voidptr = c_datagroup_create_view_from_type_bufferify( &
              group%voidptr, name, lname, type, 0_C_LONG)
        endif
    end function datagroup_create_array_view_long_scalar
    
    ! Generated by genfsidresplicer.py
    function datagroup_create_array_view_long_1d(group, name, value) result(rv)
        use iso_c_binding
        implicit none
    
        class(datagroup), intent(IN) :: group
        character(*), intent(IN) :: name
        integer(C_LONG), target, intent(IN) :: value(:)
        integer(C_INT) :: lname
        type(dataview) :: rv
        integer(SIDRE_LENGTH) :: extents(1)
        integer(C_INT), parameter :: type = SIDRE_LONG_ID
        type(C_PTR) addr
    
        lname = len_trim(name)
        call SHROUD_C_LOC(value, addr)
        if (c_associated(addr)) then
          extents = shape(value, kind=SIDRE_LENGTH)
          rv%voidptr = c_datagroup_create_view_external_bufferify( &
              group%voidptr, name, lname, addr)
          call c_dataview_apply_type_shape(rv%voidptr, type, 1, extents)
        else
          rv%voidptr = c_datagroup_create_view_from_type_bufferify( &
              group%voidptr, name, lname, type, 0_C_LONG)
        endif
    end function datagroup_create_array_view_long_1d
    
    ! Generated by genfsidresplicer.py
    function datagroup_create_array_view_long_2d(group, name, value) result(rv)
        use iso_c_binding
        implicit none
    
        class(datagroup), intent(IN) :: group
        character(*), intent(IN) :: name
        integer(C_LONG), target, intent(IN) :: value(:,:)
        integer(C_INT) :: lname
        type(dataview) :: rv
        integer(SIDRE_LENGTH) :: extents(2)
        integer(C_INT), parameter :: type = SIDRE_LONG_ID
        type(C_PTR) addr
    
        lname = len_trim(name)
        call SHROUD_C_LOC(value, addr)
        if (c_associated(addr)) then
          extents = shape(value, kind=SIDRE_LENGTH)
          rv%voidptr = c_datagroup_create_view_external_bufferify( &
              group%voidptr, name, lname, addr)
          call c_dataview_apply_type_shape(rv%voidptr, type, 2, extents)
        else
          rv%voidptr = c_datagroup_create_view_from_type_bufferify( &
              group%voidptr, name, lname, type, 0_C_LONG)
        endif
    end function datagroup_create_array_view_long_2d
    
    ! Generated by genfsidresplicer.py
    function datagroup_create_array_view_long_3d(group, name, value) result(rv)
        use iso_c_binding
        implicit none
    
        class(datagroup), intent(IN) :: group
        character(*), intent(IN) :: name
        integer(C_LONG), target, intent(IN) :: value(:,:,:)
        integer(C_INT) :: lname
        type(dataview) :: rv
        integer(SIDRE_LENGTH) :: extents(3)
        integer(C_INT), parameter :: type = SIDRE_LONG_ID
        type(C_PTR) addr
    
        lname = len_trim(name)
        call SHROUD_C_LOC(value, addr)
        if (c_associated(addr)) then
          extents = shape(value, kind=SIDRE_LENGTH)
          rv%voidptr = c_datagroup_create_view_external_bufferify( &
              group%voidptr, name, lname, addr)
          call c_dataview_apply_type_shape(rv%voidptr, type, 3, extents)
        else
          rv%voidptr = c_datagroup_create_view_from_type_bufferify( &
              group%voidptr, name, lname, type, 0_C_LONG)
        endif
    end function datagroup_create_array_view_long_3d
    
    ! Generated by genfsidresplicer.py
    function datagroup_create_array_view_long_4d(group, name, value) result(rv)
        use iso_c_binding
        implicit none
    
        class(datagroup), intent(IN) :: group
        character(*), intent(IN) :: name
        integer(C_LONG), target, intent(IN) :: value(:,:,:,:)
        integer(C_INT) :: lname
        type(dataview) :: rv
        integer(SIDRE_LENGTH) :: extents(4)
        integer(C_INT), parameter :: type = SIDRE_LONG_ID
        type(C_PTR) addr
    
        lname = len_trim(name)
        call SHROUD_C_LOC(value, addr)
        if (c_associated(addr)) then
          extents = shape(value, kind=SIDRE_LENGTH)
          rv%voidptr = c_datagroup_create_view_external_bufferify( &
              group%voidptr, name, lname, addr)
          call c_dataview_apply_type_shape(rv%voidptr, type, 4, extents)
        else
          rv%voidptr = c_datagroup_create_view_from_type_bufferify( &
              group%voidptr, name, lname, type, 0_C_LONG)
        endif
    end function datagroup_create_array_view_long_4d
    
    ! Generated by genfsidresplicer.py
    function datagroup_create_array_view_float_scalar(group, name, value) result(rv)
        use iso_c_binding
        implicit none
    
        class(datagroup), intent(IN) :: group
        character(*), intent(IN) :: name
        real(C_FLOAT), target, intent(IN) :: value
        integer(C_INT) :: lname
        type(dataview) :: rv
        integer(SIDRE_LENGTH) :: extents(1)
        integer(C_INT), parameter :: type = SIDRE_FLOAT_ID
        type(C_PTR) addr
    
        lname = len_trim(name)
        call SHROUD_C_LOC(value, addr)
        if (c_associated(addr)) then
          extents(1) = 1_SIDRE_LENGTH
          rv%voidptr = c_datagroup_create_view_external_bufferify( &
              group%voidptr, name, lname, addr)
          call c_dataview_apply_type_shape(rv%voidptr, type, 0, extents)
        else
          rv%voidptr = c_datagroup_create_view_from_type_bufferify( &
              group%voidptr, name, lname, type, 0_C_LONG)
        endif
    end function datagroup_create_array_view_float_scalar
    
    ! Generated by genfsidresplicer.py
    function datagroup_create_array_view_float_1d(group, name, value) result(rv)
        use iso_c_binding
        implicit none
    
        class(datagroup), intent(IN) :: group
        character(*), intent(IN) :: name
        real(C_FLOAT), target, intent(IN) :: value(:)
        integer(C_INT) :: lname
        type(dataview) :: rv
        integer(SIDRE_LENGTH) :: extents(1)
        integer(C_INT), parameter :: type = SIDRE_FLOAT_ID
        type(C_PTR) addr
    
        lname = len_trim(name)
        call SHROUD_C_LOC(value, addr)
        if (c_associated(addr)) then
          extents = shape(value, kind=SIDRE_LENGTH)
          rv%voidptr = c_datagroup_create_view_external_bufferify( &
              group%voidptr, name, lname, addr)
          call c_dataview_apply_type_shape(rv%voidptr, type, 1, extents)
        else
          rv%voidptr = c_datagroup_create_view_from_type_bufferify( &
              group%voidptr, name, lname, type, 0_C_LONG)
        endif
    end function datagroup_create_array_view_float_1d
    
    ! Generated by genfsidresplicer.py
    function datagroup_create_array_view_float_2d(group, name, value) result(rv)
        use iso_c_binding
        implicit none
    
        class(datagroup), intent(IN) :: group
        character(*), intent(IN) :: name
        real(C_FLOAT), target, intent(IN) :: value(:,:)
        integer(C_INT) :: lname
        type(dataview) :: rv
        integer(SIDRE_LENGTH) :: extents(2)
        integer(C_INT), parameter :: type = SIDRE_FLOAT_ID
        type(C_PTR) addr
    
        lname = len_trim(name)
        call SHROUD_C_LOC(value, addr)
        if (c_associated(addr)) then
          extents = shape(value, kind=SIDRE_LENGTH)
          rv%voidptr = c_datagroup_create_view_external_bufferify( &
              group%voidptr, name, lname, addr)
          call c_dataview_apply_type_shape(rv%voidptr, type, 2, extents)
        else
          rv%voidptr = c_datagroup_create_view_from_type_bufferify( &
              group%voidptr, name, lname, type, 0_C_LONG)
        endif
    end function datagroup_create_array_view_float_2d
    
    ! Generated by genfsidresplicer.py
    function datagroup_create_array_view_float_3d(group, name, value) result(rv)
        use iso_c_binding
        implicit none
    
        class(datagroup), intent(IN) :: group
        character(*), intent(IN) :: name
        real(C_FLOAT), target, intent(IN) :: value(:,:,:)
        integer(C_INT) :: lname
        type(dataview) :: rv
        integer(SIDRE_LENGTH) :: extents(3)
        integer(C_INT), parameter :: type = SIDRE_FLOAT_ID
        type(C_PTR) addr
    
        lname = len_trim(name)
        call SHROUD_C_LOC(value, addr)
        if (c_associated(addr)) then
          extents = shape(value, kind=SIDRE_LENGTH)
          rv%voidptr = c_datagroup_create_view_external_bufferify( &
              group%voidptr, name, lname, addr)
          call c_dataview_apply_type_shape(rv%voidptr, type, 3, extents)
        else
          rv%voidptr = c_datagroup_create_view_from_type_bufferify( &
              group%voidptr, name, lname, type, 0_C_LONG)
        endif
    end function datagroup_create_array_view_float_3d
    
    ! Generated by genfsidresplicer.py
    function datagroup_create_array_view_float_4d(group, name, value) result(rv)
        use iso_c_binding
        implicit none
    
        class(datagroup), intent(IN) :: group
        character(*), intent(IN) :: name
        real(C_FLOAT), target, intent(IN) :: value(:,:,:,:)
        integer(C_INT) :: lname
        type(dataview) :: rv
        integer(SIDRE_LENGTH) :: extents(4)
        integer(C_INT), parameter :: type = SIDRE_FLOAT_ID
        type(C_PTR) addr
    
        lname = len_trim(name)
        call SHROUD_C_LOC(value, addr)
        if (c_associated(addr)) then
          extents = shape(value, kind=SIDRE_LENGTH)
          rv%voidptr = c_datagroup_create_view_external_bufferify( &
              group%voidptr, name, lname, addr)
          call c_dataview_apply_type_shape(rv%voidptr, type, 4, extents)
        else
          rv%voidptr = c_datagroup_create_view_from_type_bufferify( &
              group%voidptr, name, lname, type, 0_C_LONG)
        endif
    end function datagroup_create_array_view_float_4d
    
    ! Generated by genfsidresplicer.py
    function datagroup_create_array_view_double_scalar(group, name, value) result(rv)
        use iso_c_binding
        implicit none
    
        class(datagroup), intent(IN) :: group
        character(*), intent(IN) :: name
        real(C_DOUBLE), target, intent(IN) :: value
        integer(C_INT) :: lname
        type(dataview) :: rv
        integer(SIDRE_LENGTH) :: extents(1)
        integer(C_INT), parameter :: type = SIDRE_DOUBLE_ID
        type(C_PTR) addr
    
        lname = len_trim(name)
        call SHROUD_C_LOC(value, addr)
        if (c_associated(addr)) then
          extents(1) = 1_SIDRE_LENGTH
          rv%voidptr = c_datagroup_create_view_external_bufferify( &
              group%voidptr, name, lname, addr)
          call c_dataview_apply_type_shape(rv%voidptr, type, 0, extents)
        else
          rv%voidptr = c_datagroup_create_view_from_type_bufferify( &
              group%voidptr, name, lname, type, 0_C_LONG)
        endif
    end function datagroup_create_array_view_double_scalar
    
    ! Generated by genfsidresplicer.py
    function datagroup_create_array_view_double_1d(group, name, value) result(rv)
        use iso_c_binding
        implicit none
    
        class(datagroup), intent(IN) :: group
        character(*), intent(IN) :: name
        real(C_DOUBLE), target, intent(IN) :: value(:)
        integer(C_INT) :: lname
        type(dataview) :: rv
        integer(SIDRE_LENGTH) :: extents(1)
        integer(C_INT), parameter :: type = SIDRE_DOUBLE_ID
        type(C_PTR) addr
    
        lname = len_trim(name)
        call SHROUD_C_LOC(value, addr)
        if (c_associated(addr)) then
          extents = shape(value, kind=SIDRE_LENGTH)
          rv%voidptr = c_datagroup_create_view_external_bufferify( &
              group%voidptr, name, lname, addr)
          call c_dataview_apply_type_shape(rv%voidptr, type, 1, extents)
        else
          rv%voidptr = c_datagroup_create_view_from_type_bufferify( &
              group%voidptr, name, lname, type, 0_C_LONG)
        endif
    end function datagroup_create_array_view_double_1d
    
    ! Generated by genfsidresplicer.py
    function datagroup_create_array_view_double_2d(group, name, value) result(rv)
        use iso_c_binding
        implicit none
    
        class(datagroup), intent(IN) :: group
        character(*), intent(IN) :: name
        real(C_DOUBLE), target, intent(IN) :: value(:,:)
        integer(C_INT) :: lname
        type(dataview) :: rv
        integer(SIDRE_LENGTH) :: extents(2)
        integer(C_INT), parameter :: type = SIDRE_DOUBLE_ID
        type(C_PTR) addr
    
        lname = len_trim(name)
        call SHROUD_C_LOC(value, addr)
        if (c_associated(addr)) then
          extents = shape(value, kind=SIDRE_LENGTH)
          rv%voidptr = c_datagroup_create_view_external_bufferify( &
              group%voidptr, name, lname, addr)
          call c_dataview_apply_type_shape(rv%voidptr, type, 2, extents)
        else
          rv%voidptr = c_datagroup_create_view_from_type_bufferify( &
              group%voidptr, name, lname, type, 0_C_LONG)
        endif
    end function datagroup_create_array_view_double_2d
    
    ! Generated by genfsidresplicer.py
    function datagroup_create_array_view_double_3d(group, name, value) result(rv)
        use iso_c_binding
        implicit none
    
        class(datagroup), intent(IN) :: group
        character(*), intent(IN) :: name
        real(C_DOUBLE), target, intent(IN) :: value(:,:,:)
        integer(C_INT) :: lname
        type(dataview) :: rv
        integer(SIDRE_LENGTH) :: extents(3)
        integer(C_INT), parameter :: type = SIDRE_DOUBLE_ID
        type(C_PTR) addr
    
        lname = len_trim(name)
        call SHROUD_C_LOC(value, addr)
        if (c_associated(addr)) then
          extents = shape(value, kind=SIDRE_LENGTH)
          rv%voidptr = c_datagroup_create_view_external_bufferify( &
              group%voidptr, name, lname, addr)
          call c_dataview_apply_type_shape(rv%voidptr, type, 3, extents)
        else
          rv%voidptr = c_datagroup_create_view_from_type_bufferify( &
              group%voidptr, name, lname, type, 0_C_LONG)
        endif
    end function datagroup_create_array_view_double_3d
    
    ! Generated by genfsidresplicer.py
    function datagroup_create_array_view_double_4d(group, name, value) result(rv)
        use iso_c_binding
        implicit none
    
        class(datagroup), intent(IN) :: group
        character(*), intent(IN) :: name
        real(C_DOUBLE), target, intent(IN) :: value(:,:,:,:)
        integer(C_INT) :: lname
        type(dataview) :: rv
        integer(SIDRE_LENGTH) :: extents(4)
        integer(C_INT), parameter :: type = SIDRE_DOUBLE_ID
        type(C_PTR) addr
    
        lname = len_trim(name)
        call SHROUD_C_LOC(value, addr)
        if (c_associated(addr)) then
          extents = shape(value, kind=SIDRE_LENGTH)
          rv%voidptr = c_datagroup_create_view_external_bufferify( &
              group%voidptr, name, lname, addr)
          call c_dataview_apply_type_shape(rv%voidptr, type, 4, extents)
        else
          rv%voidptr = c_datagroup_create_view_from_type_bufferify( &
              group%voidptr, name, lname, type, 0_C_LONG)
        endif
    end function datagroup_create_array_view_double_4d
    
    ! Generated by genfsidresplicer.py
    ! This function does nothing if view name does not exist in group.
    subroutine datagroup_set_array_data_ptr_int_scalar(group, name, value)
        use iso_c_binding
        implicit none
    
        class(datagroup), intent(IN) :: group
        character(len=*), intent(IN) :: name
        integer(C_INT), target, intent(IN) :: value
        integer(C_INT) :: lname
        type(C_ptr) view
    !    integer(SIDRE_LENGTH) :: extents(1)
    !    integer(C_INT), parameter :: type = SIDRE_INT_ID
        type(C_PTR) addr
    
        lname = len_trim(name)
    !    extents(1) = 1_SIDRE_LENGTH
        view = c_datagroup_get_view_from_name_bufferify(group%voidptr, name, lname)
        if (c_associated(view)) then
            call SHROUD_C_LOC(value, addr)
            call c_dataview_set_external_data_ptr_only(view, addr)
    !        call c_dataview_apply_type_shape(rv%voidptr, type, 0, extents)
        endif
    end subroutine datagroup_set_array_data_ptr_int_scalar
    
    ! Generated by genfsidresplicer.py
    ! This function does nothing if view name does not exist in group.
    subroutine datagroup_set_array_data_ptr_int_1d(group, name, value)
        use iso_c_binding
        implicit none
    
        class(datagroup), intent(IN) :: group
        character(len=*), intent(IN) :: name
        integer(C_INT), target, intent(IN) :: value(:)
        integer(C_INT) :: lname
        type(C_ptr) view
    !    integer(SIDRE_LENGTH) :: extents(1)
    !    integer(C_INT), parameter :: type = SIDRE_INT_ID
        type(C_PTR) addr
    
        lname = len_trim(name)
    !    extents = shape(value, kind=SIDRE_LENGTH)
        view = c_datagroup_get_view_from_name_bufferify(group%voidptr, name, lname)
        if (c_associated(view)) then
            call SHROUD_C_LOC(value, addr)
            call c_dataview_set_external_data_ptr_only(view, addr)
    !        call c_dataview_apply_type_shape(rv%voidptr, type, 1, extents)
        endif
    end subroutine datagroup_set_array_data_ptr_int_1d
    
    ! Generated by genfsidresplicer.py
    ! This function does nothing if view name does not exist in group.
    subroutine datagroup_set_array_data_ptr_int_2d(group, name, value)
        use iso_c_binding
        implicit none
    
        class(datagroup), intent(IN) :: group
        character(len=*), intent(IN) :: name
        integer(C_INT), target, intent(IN) :: value(:,:)
        integer(C_INT) :: lname
        type(C_ptr) view
    !    integer(SIDRE_LENGTH) :: extents(2)
    !    integer(C_INT), parameter :: type = SIDRE_INT_ID
        type(C_PTR) addr
    
        lname = len_trim(name)
    !    extents = shape(value, kind=SIDRE_LENGTH)
        view = c_datagroup_get_view_from_name_bufferify(group%voidptr, name, lname)
        if (c_associated(view)) then
            call SHROUD_C_LOC(value, addr)
            call c_dataview_set_external_data_ptr_only(view, addr)
    !        call c_dataview_apply_type_shape(rv%voidptr, type, 2, extents)
        endif
    end subroutine datagroup_set_array_data_ptr_int_2d
    
    ! Generated by genfsidresplicer.py
    ! This function does nothing if view name does not exist in group.
    subroutine datagroup_set_array_data_ptr_int_3d(group, name, value)
        use iso_c_binding
        implicit none
    
        class(datagroup), intent(IN) :: group
        character(len=*), intent(IN) :: name
        integer(C_INT), target, intent(IN) :: value(:,:,:)
        integer(C_INT) :: lname
        type(C_ptr) view
    !    integer(SIDRE_LENGTH) :: extents(3)
    !    integer(C_INT), parameter :: type = SIDRE_INT_ID
        type(C_PTR) addr
    
        lname = len_trim(name)
    !    extents = shape(value, kind=SIDRE_LENGTH)
        view = c_datagroup_get_view_from_name_bufferify(group%voidptr, name, lname)
        if (c_associated(view)) then
            call SHROUD_C_LOC(value, addr)
            call c_dataview_set_external_data_ptr_only(view, addr)
    !        call c_dataview_apply_type_shape(rv%voidptr, type, 3, extents)
        endif
    end subroutine datagroup_set_array_data_ptr_int_3d
    
    ! Generated by genfsidresplicer.py
    ! This function does nothing if view name does not exist in group.
    subroutine datagroup_set_array_data_ptr_int_4d(group, name, value)
        use iso_c_binding
        implicit none
    
        class(datagroup), intent(IN) :: group
        character(len=*), intent(IN) :: name
        integer(C_INT), target, intent(IN) :: value(:,:,:,:)
        integer(C_INT) :: lname
        type(C_ptr) view
    !    integer(SIDRE_LENGTH) :: extents(4)
    !    integer(C_INT), parameter :: type = SIDRE_INT_ID
        type(C_PTR) addr
    
        lname = len_trim(name)
    !    extents = shape(value, kind=SIDRE_LENGTH)
        view = c_datagroup_get_view_from_name_bufferify(group%voidptr, name, lname)
        if (c_associated(view)) then
            call SHROUD_C_LOC(value, addr)
            call c_dataview_set_external_data_ptr_only(view, addr)
    !        call c_dataview_apply_type_shape(rv%voidptr, type, 4, extents)
        endif
    end subroutine datagroup_set_array_data_ptr_int_4d
    
    ! Generated by genfsidresplicer.py
    ! This function does nothing if view name does not exist in group.
    subroutine datagroup_set_array_data_ptr_long_scalar(group, name, value)
        use iso_c_binding
        implicit none
    
        class(datagroup), intent(IN) :: group
        character(len=*), intent(IN) :: name
        integer(C_LONG), target, intent(IN) :: value
        integer(C_INT) :: lname
        type(C_ptr) view
    !    integer(SIDRE_LENGTH) :: extents(1)
    !    integer(C_INT), parameter :: type = SIDRE_LONG_ID
        type(C_PTR) addr
    
        lname = len_trim(name)
    !    extents(1) = 1_SIDRE_LENGTH
        view = c_datagroup_get_view_from_name_bufferify(group%voidptr, name, lname)
        if (c_associated(view)) then
            call SHROUD_C_LOC(value, addr)
            call c_dataview_set_external_data_ptr_only(view, addr)
    !        call c_dataview_apply_type_shape(rv%voidptr, type, 0, extents)
        endif
    end subroutine datagroup_set_array_data_ptr_long_scalar
    
    ! Generated by genfsidresplicer.py
    ! This function does nothing if view name does not exist in group.
    subroutine datagroup_set_array_data_ptr_long_1d(group, name, value)
        use iso_c_binding
        implicit none
    
        class(datagroup), intent(IN) :: group
        character(len=*), intent(IN) :: name
        integer(C_LONG), target, intent(IN) :: value(:)
        integer(C_INT) :: lname
        type(C_ptr) view
    !    integer(SIDRE_LENGTH) :: extents(1)
    !    integer(C_INT), parameter :: type = SIDRE_LONG_ID
        type(C_PTR) addr
    
        lname = len_trim(name)
    !    extents = shape(value, kind=SIDRE_LENGTH)
        view = c_datagroup_get_view_from_name_bufferify(group%voidptr, name, lname)
        if (c_associated(view)) then
            call SHROUD_C_LOC(value, addr)
            call c_dataview_set_external_data_ptr_only(view, addr)
    !        call c_dataview_apply_type_shape(rv%voidptr, type, 1, extents)
        endif
    end subroutine datagroup_set_array_data_ptr_long_1d
    
    ! Generated by genfsidresplicer.py
    ! This function does nothing if view name does not exist in group.
    subroutine datagroup_set_array_data_ptr_long_2d(group, name, value)
        use iso_c_binding
        implicit none
    
        class(datagroup), intent(IN) :: group
        character(len=*), intent(IN) :: name
        integer(C_LONG), target, intent(IN) :: value(:,:)
        integer(C_INT) :: lname
        type(C_ptr) view
    !    integer(SIDRE_LENGTH) :: extents(2)
    !    integer(C_INT), parameter :: type = SIDRE_LONG_ID
        type(C_PTR) addr
    
        lname = len_trim(name)
    !    extents = shape(value, kind=SIDRE_LENGTH)
        view = c_datagroup_get_view_from_name_bufferify(group%voidptr, name, lname)
        if (c_associated(view)) then
            call SHROUD_C_LOC(value, addr)
            call c_dataview_set_external_data_ptr_only(view, addr)
    !        call c_dataview_apply_type_shape(rv%voidptr, type, 2, extents)
        endif
    end subroutine datagroup_set_array_data_ptr_long_2d
    
    ! Generated by genfsidresplicer.py
    ! This function does nothing if view name does not exist in group.
    subroutine datagroup_set_array_data_ptr_long_3d(group, name, value)
        use iso_c_binding
        implicit none
    
        class(datagroup), intent(IN) :: group
        character(len=*), intent(IN) :: name
        integer(C_LONG), target, intent(IN) :: value(:,:,:)
        integer(C_INT) :: lname
        type(C_ptr) view
    !    integer(SIDRE_LENGTH) :: extents(3)
    !    integer(C_INT), parameter :: type = SIDRE_LONG_ID
        type(C_PTR) addr
    
        lname = len_trim(name)
    !    extents = shape(value, kind=SIDRE_LENGTH)
        view = c_datagroup_get_view_from_name_bufferify(group%voidptr, name, lname)
        if (c_associated(view)) then
            call SHROUD_C_LOC(value, addr)
            call c_dataview_set_external_data_ptr_only(view, addr)
    !        call c_dataview_apply_type_shape(rv%voidptr, type, 3, extents)
        endif
    end subroutine datagroup_set_array_data_ptr_long_3d
    
    ! Generated by genfsidresplicer.py
    ! This function does nothing if view name does not exist in group.
    subroutine datagroup_set_array_data_ptr_long_4d(group, name, value)
        use iso_c_binding
        implicit none
    
        class(datagroup), intent(IN) :: group
        character(len=*), intent(IN) :: name
        integer(C_LONG), target, intent(IN) :: value(:,:,:,:)
        integer(C_INT) :: lname
        type(C_ptr) view
    !    integer(SIDRE_LENGTH) :: extents(4)
    !    integer(C_INT), parameter :: type = SIDRE_LONG_ID
        type(C_PTR) addr
    
        lname = len_trim(name)
    !    extents = shape(value, kind=SIDRE_LENGTH)
        view = c_datagroup_get_view_from_name_bufferify(group%voidptr, name, lname)
        if (c_associated(view)) then
            call SHROUD_C_LOC(value, addr)
            call c_dataview_set_external_data_ptr_only(view, addr)
    !        call c_dataview_apply_type_shape(rv%voidptr, type, 4, extents)
        endif
    end subroutine datagroup_set_array_data_ptr_long_4d
    
    ! Generated by genfsidresplicer.py
    ! This function does nothing if view name does not exist in group.
    subroutine datagroup_set_array_data_ptr_float_scalar(group, name, value)
        use iso_c_binding
        implicit none
    
        class(datagroup), intent(IN) :: group
        character(len=*), intent(IN) :: name
        real(C_FLOAT), target, intent(IN) :: value
        integer(C_INT) :: lname
        type(C_ptr) view
    !    integer(SIDRE_LENGTH) :: extents(1)
    !    integer(C_INT), parameter :: type = SIDRE_FLOAT_ID
        type(C_PTR) addr
    
        lname = len_trim(name)
    !    extents(1) = 1_SIDRE_LENGTH
        view = c_datagroup_get_view_from_name_bufferify(group%voidptr, name, lname)
        if (c_associated(view)) then
            call SHROUD_C_LOC(value, addr)
            call c_dataview_set_external_data_ptr_only(view, addr)
    !        call c_dataview_apply_type_shape(rv%voidptr, type, 0, extents)
        endif
    end subroutine datagroup_set_array_data_ptr_float_scalar
    
    ! Generated by genfsidresplicer.py
    ! This function does nothing if view name does not exist in group.
    subroutine datagroup_set_array_data_ptr_float_1d(group, name, value)
        use iso_c_binding
        implicit none
    
        class(datagroup), intent(IN) :: group
        character(len=*), intent(IN) :: name
        real(C_FLOAT), target, intent(IN) :: value(:)
        integer(C_INT) :: lname
        type(C_ptr) view
    !    integer(SIDRE_LENGTH) :: extents(1)
    !    integer(C_INT), parameter :: type = SIDRE_FLOAT_ID
        type(C_PTR) addr
    
        lname = len_trim(name)
    !    extents = shape(value, kind=SIDRE_LENGTH)
        view = c_datagroup_get_view_from_name_bufferify(group%voidptr, name, lname)
        if (c_associated(view)) then
            call SHROUD_C_LOC(value, addr)
            call c_dataview_set_external_data_ptr_only(view, addr)
    !        call c_dataview_apply_type_shape(rv%voidptr, type, 1, extents)
        endif
    end subroutine datagroup_set_array_data_ptr_float_1d
    
    ! Generated by genfsidresplicer.py
    ! This function does nothing if view name does not exist in group.
    subroutine datagroup_set_array_data_ptr_float_2d(group, name, value)
        use iso_c_binding
        implicit none
    
        class(datagroup), intent(IN) :: group
        character(len=*), intent(IN) :: name
        real(C_FLOAT), target, intent(IN) :: value(:,:)
        integer(C_INT) :: lname
        type(C_ptr) view
    !    integer(SIDRE_LENGTH) :: extents(2)
    !    integer(C_INT), parameter :: type = SIDRE_FLOAT_ID
        type(C_PTR) addr
    
        lname = len_trim(name)
    !    extents = shape(value, kind=SIDRE_LENGTH)
        view = c_datagroup_get_view_from_name_bufferify(group%voidptr, name, lname)
        if (c_associated(view)) then
            call SHROUD_C_LOC(value, addr)
            call c_dataview_set_external_data_ptr_only(view, addr)
    !        call c_dataview_apply_type_shape(rv%voidptr, type, 2, extents)
        endif
    end subroutine datagroup_set_array_data_ptr_float_2d
    
    ! Generated by genfsidresplicer.py
    ! This function does nothing if view name does not exist in group.
    subroutine datagroup_set_array_data_ptr_float_3d(group, name, value)
        use iso_c_binding
        implicit none
    
        class(datagroup), intent(IN) :: group
        character(len=*), intent(IN) :: name
        real(C_FLOAT), target, intent(IN) :: value(:,:,:)
        integer(C_INT) :: lname
        type(C_ptr) view
    !    integer(SIDRE_LENGTH) :: extents(3)
    !    integer(C_INT), parameter :: type = SIDRE_FLOAT_ID
        type(C_PTR) addr
    
        lname = len_trim(name)
    !    extents = shape(value, kind=SIDRE_LENGTH)
        view = c_datagroup_get_view_from_name_bufferify(group%voidptr, name, lname)
        if (c_associated(view)) then
            call SHROUD_C_LOC(value, addr)
            call c_dataview_set_external_data_ptr_only(view, addr)
    !        call c_dataview_apply_type_shape(rv%voidptr, type, 3, extents)
        endif
    end subroutine datagroup_set_array_data_ptr_float_3d
    
    ! Generated by genfsidresplicer.py
    ! This function does nothing if view name does not exist in group.
    subroutine datagroup_set_array_data_ptr_float_4d(group, name, value)
        use iso_c_binding
        implicit none
    
        class(datagroup), intent(IN) :: group
        character(len=*), intent(IN) :: name
        real(C_FLOAT), target, intent(IN) :: value(:,:,:,:)
        integer(C_INT) :: lname
        type(C_ptr) view
    !    integer(SIDRE_LENGTH) :: extents(4)
    !    integer(C_INT), parameter :: type = SIDRE_FLOAT_ID
        type(C_PTR) addr
    
        lname = len_trim(name)
    !    extents = shape(value, kind=SIDRE_LENGTH)
        view = c_datagroup_get_view_from_name_bufferify(group%voidptr, name, lname)
        if (c_associated(view)) then
            call SHROUD_C_LOC(value, addr)
            call c_dataview_set_external_data_ptr_only(view, addr)
    !        call c_dataview_apply_type_shape(rv%voidptr, type, 4, extents)
        endif
    end subroutine datagroup_set_array_data_ptr_float_4d
    
    ! Generated by genfsidresplicer.py
    ! This function does nothing if view name does not exist in group.
    subroutine datagroup_set_array_data_ptr_double_scalar(group, name, value)
        use iso_c_binding
        implicit none
    
        class(datagroup), intent(IN) :: group
        character(len=*), intent(IN) :: name
        real(C_DOUBLE), target, intent(IN) :: value
        integer(C_INT) :: lname
        type(C_ptr) view
    !    integer(SIDRE_LENGTH) :: extents(1)
    !    integer(C_INT), parameter :: type = SIDRE_DOUBLE_ID
        type(C_PTR) addr
    
        lname = len_trim(name)
    !    extents(1) = 1_SIDRE_LENGTH
        view = c_datagroup_get_view_from_name_bufferify(group%voidptr, name, lname)
        if (c_associated(view)) then
            call SHROUD_C_LOC(value, addr)
            call c_dataview_set_external_data_ptr_only(view, addr)
    !        call c_dataview_apply_type_shape(rv%voidptr, type, 0, extents)
        endif
    end subroutine datagroup_set_array_data_ptr_double_scalar
    
    ! Generated by genfsidresplicer.py
    ! This function does nothing if view name does not exist in group.
    subroutine datagroup_set_array_data_ptr_double_1d(group, name, value)
        use iso_c_binding
        implicit none
    
        class(datagroup), intent(IN) :: group
        character(len=*), intent(IN) :: name
        real(C_DOUBLE), target, intent(IN) :: value(:)
        integer(C_INT) :: lname
        type(C_ptr) view
    !    integer(SIDRE_LENGTH) :: extents(1)
    !    integer(C_INT), parameter :: type = SIDRE_DOUBLE_ID
        type(C_PTR) addr
    
        lname = len_trim(name)
    !    extents = shape(value, kind=SIDRE_LENGTH)
        view = c_datagroup_get_view_from_name_bufferify(group%voidptr, name, lname)
        if (c_associated(view)) then
            call SHROUD_C_LOC(value, addr)
            call c_dataview_set_external_data_ptr_only(view, addr)
    !        call c_dataview_apply_type_shape(rv%voidptr, type, 1, extents)
        endif
    end subroutine datagroup_set_array_data_ptr_double_1d
    
    ! Generated by genfsidresplicer.py
    ! This function does nothing if view name does not exist in group.
    subroutine datagroup_set_array_data_ptr_double_2d(group, name, value)
        use iso_c_binding
        implicit none
    
        class(datagroup), intent(IN) :: group
        character(len=*), intent(IN) :: name
        real(C_DOUBLE), target, intent(IN) :: value(:,:)
        integer(C_INT) :: lname
        type(C_ptr) view
    !    integer(SIDRE_LENGTH) :: extents(2)
    !    integer(C_INT), parameter :: type = SIDRE_DOUBLE_ID
        type(C_PTR) addr
    
        lname = len_trim(name)
    !    extents = shape(value, kind=SIDRE_LENGTH)
        view = c_datagroup_get_view_from_name_bufferify(group%voidptr, name, lname)
        if (c_associated(view)) then
            call SHROUD_C_LOC(value, addr)
            call c_dataview_set_external_data_ptr_only(view, addr)
    !        call c_dataview_apply_type_shape(rv%voidptr, type, 2, extents)
        endif
    end subroutine datagroup_set_array_data_ptr_double_2d
    
    ! Generated by genfsidresplicer.py
    ! This function does nothing if view name does not exist in group.
    subroutine datagroup_set_array_data_ptr_double_3d(group, name, value)
        use iso_c_binding
        implicit none
    
        class(datagroup), intent(IN) :: group
        character(len=*), intent(IN) :: name
        real(C_DOUBLE), target, intent(IN) :: value(:,:,:)
        integer(C_INT) :: lname
        type(C_ptr) view
    !    integer(SIDRE_LENGTH) :: extents(3)
    !    integer(C_INT), parameter :: type = SIDRE_DOUBLE_ID
        type(C_PTR) addr
    
        lname = len_trim(name)
    !    extents = shape(value, kind=SIDRE_LENGTH)
        view = c_datagroup_get_view_from_name_bufferify(group%voidptr, name, lname)
        if (c_associated(view)) then
            call SHROUD_C_LOC(value, addr)
            call c_dataview_set_external_data_ptr_only(view, addr)
    !        call c_dataview_apply_type_shape(rv%voidptr, type, 3, extents)
        endif
    end subroutine datagroup_set_array_data_ptr_double_3d
    
    ! Generated by genfsidresplicer.py
    ! This function does nothing if view name does not exist in group.
    subroutine datagroup_set_array_data_ptr_double_4d(group, name, value)
        use iso_c_binding
        implicit none
    
        class(datagroup), intent(IN) :: group
        character(len=*), intent(IN) :: name
        real(C_DOUBLE), target, intent(IN) :: value(:,:,:,:)
        integer(C_INT) :: lname
        type(C_ptr) view
    !    integer(SIDRE_LENGTH) :: extents(4)
    !    integer(C_INT), parameter :: type = SIDRE_DOUBLE_ID
        type(C_PTR) addr
    
        lname = len_trim(name)
    !    extents = shape(value, kind=SIDRE_LENGTH)
        view = c_datagroup_get_view_from_name_bufferify(group%voidptr, name, lname)
        if (c_associated(view)) then
            call SHROUD_C_LOC(value, addr)
            call c_dataview_set_external_data_ptr_only(view, addr)
    !        call c_dataview_apply_type_shape(rv%voidptr, type, 4, extents)
        endif
    end subroutine datagroup_set_array_data_ptr_double_4d
    ! splicer end class.DataGroup.additional_functions
    
    function databuffer_get_index(obj) result(rv)
        use iso_c_binding, only : C_INT
        implicit none
        class(databuffer) :: obj
        integer(C_INT) :: rv
        ! splicer begin class.DataBuffer.method.get_index
        rv = c_databuffer_get_index(obj%voidptr)
        ! splicer end class.DataBuffer.method.get_index
    end function databuffer_get_index
    
    function databuffer_get_num_views(obj) result(rv)
        use iso_c_binding, only : C_SIZE_T
        implicit none
        class(databuffer) :: obj
        integer(C_SIZE_T) :: rv
        ! splicer begin class.DataBuffer.method.get_num_views
        rv = c_databuffer_get_num_views(obj%voidptr)
        ! splicer end class.DataBuffer.method.get_num_views
    end function databuffer_get_num_views
    
    subroutine databuffer_describe_int(obj, type, num_elems)
        use iso_c_binding, only : C_LONG, C_INT
        implicit none
        class(databuffer) :: obj
        integer(C_INT), value, intent(IN) :: type
        integer(C_INT), value, intent(IN) :: num_elems
        ! splicer begin class.DataBuffer.method.describe_int
        call c_databuffer_describe(  &
            obj%voidptr,  &
            type,  &
            int(num_elems, C_LONG))
        ! splicer end class.DataBuffer.method.describe_int
    end subroutine databuffer_describe_int
    
    subroutine databuffer_describe_long(obj, type, num_elems)
        use iso_c_binding, only : C_LONG, C_INT
        implicit none
        class(databuffer) :: obj
        integer(C_INT), value, intent(IN) :: type
        integer(C_LONG), value, intent(IN) :: num_elems
        ! splicer begin class.DataBuffer.method.describe_long
        call c_databuffer_describe(  &
            obj%voidptr,  &
            type,  &
            int(num_elems, C_LONG))
        ! splicer end class.DataBuffer.method.describe_long
    end subroutine databuffer_describe_long
    
    subroutine databuffer_allocate_existing(obj)
        implicit none
        class(databuffer) :: obj
        ! splicer begin class.DataBuffer.method.allocate_existing
        call c_databuffer_allocate_existing(obj%voidptr)
        ! splicer end class.DataBuffer.method.allocate_existing
    end subroutine databuffer_allocate_existing
    
    subroutine databuffer_allocate_from_type_int(obj, type, num_elems)
        use iso_c_binding, only : C_LONG, C_INT
        implicit none
        class(databuffer) :: obj
        integer(C_INT), value, intent(IN) :: type
        integer(C_INT), value, intent(IN) :: num_elems
        ! splicer begin class.DataBuffer.method.allocate_from_type_int
        call c_databuffer_allocate_from_type(  &
            obj%voidptr,  &
            type,  &
            int(num_elems, C_LONG))
        ! splicer end class.DataBuffer.method.allocate_from_type_int
    end subroutine databuffer_allocate_from_type_int
    
    subroutine databuffer_allocate_from_type_long(obj, type, num_elems)
        use iso_c_binding, only : C_LONG, C_INT
        implicit none
        class(databuffer) :: obj
        integer(C_INT), value, intent(IN) :: type
        integer(C_LONG), value, intent(IN) :: num_elems
        ! splicer begin class.DataBuffer.method.allocate_from_type_long
        call c_databuffer_allocate_from_type(  &
            obj%voidptr,  &
            type,  &
            int(num_elems, C_LONG))
        ! splicer end class.DataBuffer.method.allocate_from_type_long
    end subroutine databuffer_allocate_from_type_long
    
    subroutine databuffer_reallocate_int(obj, num_elems)
        use iso_c_binding, only : C_LONG, C_INT
        implicit none
        class(databuffer) :: obj
        integer(C_INT), value, intent(IN) :: num_elems
        ! splicer begin class.DataBuffer.method.reallocate_int
        call c_databuffer_reallocate(  &
            obj%voidptr,  &
            int(num_elems, C_LONG))
        ! splicer end class.DataBuffer.method.reallocate_int
    end subroutine databuffer_reallocate_int
    
    subroutine databuffer_reallocate_long(obj, num_elems)
        use iso_c_binding, only : C_LONG
        implicit none
        class(databuffer) :: obj
        integer(C_LONG), value, intent(IN) :: num_elems
        ! splicer begin class.DataBuffer.method.reallocate_long
        call c_databuffer_reallocate(  &
            obj%voidptr,  &
            int(num_elems, C_LONG))
        ! splicer end class.DataBuffer.method.reallocate_long
    end subroutine databuffer_reallocate_long
    
    function databuffer_get_void_ptr(obj) result(rv)
        implicit none
        class(databuffer) :: obj
        type(C_PTR) :: rv
        ! splicer begin class.DataBuffer.method.get_void_ptr
        rv = c_databuffer_get_void_ptr(obj%voidptr)
        ! splicer end class.DataBuffer.method.get_void_ptr
    end function databuffer_get_void_ptr
    
    function databuffer_get_type_id(obj) result(rv)
        use iso_c_binding, only : C_INT
        implicit none
        class(databuffer) :: obj
        integer(C_INT) :: rv
        ! splicer begin class.DataBuffer.method.get_type_id
        rv = c_databuffer_get_type_id(obj%voidptr)
        ! splicer end class.DataBuffer.method.get_type_id
    end function databuffer_get_type_id
    
    function databuffer_get_num_elements(obj) result(rv)
        use iso_c_binding, only : C_SIZE_T
        implicit none
        class(databuffer) :: obj
        integer(C_SIZE_T) :: rv
        ! splicer begin class.DataBuffer.method.get_num_elements
        rv = c_databuffer_get_num_elements(obj%voidptr)
        ! splicer end class.DataBuffer.method.get_num_elements
    end function databuffer_get_num_elements
    
    function databuffer_get_total_bytes(obj) result(rv)
        use iso_c_binding, only : C_SIZE_T
        implicit none
        class(databuffer) :: obj
        integer(C_SIZE_T) :: rv
        ! splicer begin class.DataBuffer.method.get_total_bytes
        rv = c_databuffer_get_total_bytes(obj%voidptr)
        ! splicer end class.DataBuffer.method.get_total_bytes
    end function databuffer_get_total_bytes
    
    subroutine databuffer_print(obj)
        implicit none
        class(databuffer) :: obj
        ! splicer begin class.DataBuffer.method.print
        call c_databuffer_print(obj%voidptr)
        ! splicer end class.DataBuffer.method.print
    end subroutine databuffer_print
    
    function databuffer_get_instance(obj) result (voidptr)
        use iso_c_binding, only: C_PTR
        implicit none
        class(databuffer), intent(IN) :: obj
        type(C_PTR) :: voidptr
        voidptr = obj%voidptr
    end function databuffer_get_instance
    
    subroutine databuffer_set_instance(obj, voidptr)
        use iso_c_binding, only: C_PTR
        implicit none
        class(databuffer), intent(INOUT) :: obj
        type(C_PTR), intent(IN) :: voidptr
        obj%voidptr = voidptr
    end subroutine databuffer_set_instance
    
    function databuffer_associated(obj) result (rv)
        use iso_c_binding, only: c_associated
        implicit none
        class(databuffer), intent(IN) :: obj
        logical rv
        rv = c_associated(obj%voidptr)
    end function databuffer_associated
    
    ! splicer begin class.DataBuffer.additional_functions
    ! splicer end class.DataBuffer.additional_functions
    
    subroutine dataview_allocate_simple(obj)
        implicit none
        class(dataview) :: obj
        ! splicer begin class.DataView.method.allocate_simple
        call c_dataview_allocate_simple(obj%voidptr)
        ! splicer end class.DataView.method.allocate_simple
    end subroutine dataview_allocate_simple
    
    subroutine dataview_allocate_from_type_int(obj, type, num_elems)
        use iso_c_binding, only : C_LONG, C_INT
        implicit none
        class(dataview) :: obj
        integer(C_INT), value, intent(IN) :: type
        integer(C_INT), value, intent(IN) :: num_elems
        ! splicer begin class.DataView.method.allocate_from_type_int
        call c_dataview_allocate_from_type(  &
            obj%voidptr,  &
            type,  &
            int(num_elems, C_LONG))
        ! splicer end class.DataView.method.allocate_from_type_int
    end subroutine dataview_allocate_from_type_int
    
    subroutine dataview_allocate_from_type_long(obj, type, num_elems)
        use iso_c_binding, only : C_LONG, C_INT
        implicit none
        class(dataview) :: obj
        integer(C_INT), value, intent(IN) :: type
        integer(C_LONG), value, intent(IN) :: num_elems
        ! splicer begin class.DataView.method.allocate_from_type_long
        call c_dataview_allocate_from_type(  &
            obj%voidptr,  &
            type,  &
            int(num_elems, C_LONG))
        ! splicer end class.DataView.method.allocate_from_type_long
    end subroutine dataview_allocate_from_type_long
    
    subroutine dataview_reallocate_int(obj, num_elems)
        use iso_c_binding, only : C_LONG, C_INT
        implicit none
        class(dataview) :: obj
        integer(C_INT), value, intent(IN) :: num_elems
        ! splicer begin class.DataView.method.reallocate_int
        call c_dataview_reallocate(  &
            obj%voidptr,  &
            int(num_elems, C_LONG))
        ! splicer end class.DataView.method.reallocate_int
    end subroutine dataview_reallocate_int
    
    subroutine dataview_reallocate_long(obj, num_elems)
        use iso_c_binding, only : C_LONG
        implicit none
        class(dataview) :: obj
        integer(C_LONG), value, intent(IN) :: num_elems
        ! splicer begin class.DataView.method.reallocate_long
        call c_dataview_reallocate(  &
            obj%voidptr,  &
            int(num_elems, C_LONG))
        ! splicer end class.DataView.method.reallocate_long
    end subroutine dataview_reallocate_long
    
    subroutine dataview_apply_0(obj)
        implicit none
        class(dataview) :: obj
        ! splicer begin class.DataView.method.apply_0
        call c_dataview_apply_0(obj%voidptr)
        ! splicer end class.DataView.method.apply_0
    end subroutine dataview_apply_0
    
    subroutine dataview_attach_buffer_only(obj, buff)
        implicit none
        class(dataview) :: obj
        type(databuffer), value, intent(IN) :: buff
        ! splicer begin class.DataView.method.attach_buffer_only
        call c_dataview_attach_buffer_only(  &
            obj%voidptr,  &
            buff%voidptr)
        ! splicer end class.DataView.method.attach_buffer_only
    end subroutine dataview_attach_buffer_only
    
    subroutine dataview_attach_buffer_type_int(obj, type, num_elems, buff)
        use iso_c_binding, only : C_LONG, C_INT
        implicit none
        class(dataview) :: obj
        integer(C_INT), value, intent(IN) :: type
        integer(C_INT), value, intent(IN) :: num_elems
        type(databuffer), value, intent(IN) :: buff
        ! splicer begin class.DataView.method.attach_buffer_type_int
        call c_dataview_attach_buffer_type(  &
            obj%voidptr,  &
            type,  &
            int(num_elems, C_LONG),  &
            buff%voidptr)
        ! splicer end class.DataView.method.attach_buffer_type_int
    end subroutine dataview_attach_buffer_type_int
    
    subroutine dataview_attach_buffer_type_long(obj, type, num_elems, buff)
        use iso_c_binding, only : C_LONG, C_INT
        implicit none
        class(dataview) :: obj
        integer(C_INT), value, intent(IN) :: type
        integer(C_LONG), value, intent(IN) :: num_elems
        type(databuffer), value, intent(IN) :: buff
        ! splicer begin class.DataView.method.attach_buffer_type_long
        call c_dataview_attach_buffer_type(  &
            obj%voidptr,  &
            type,  &
            int(num_elems, C_LONG),  &
            buff%voidptr)
        ! splicer end class.DataView.method.attach_buffer_type_long
    end subroutine dataview_attach_buffer_type_long
    
    subroutine dataview_attach_buffer_shape(obj, type, ndims, shape, buff)
        use iso_c_binding, only : C_LONG, C_INT
        implicit none
        class(dataview) :: obj
        integer(C_INT), value, intent(IN) :: type
        integer(C_INT), value, intent(IN) :: ndims
        integer(C_LONG), intent(IN) :: shape(*)
        type(databuffer), value, intent(IN) :: buff
        ! splicer begin class.DataView.method.attach_buffer_shape
        call c_dataview_attach_buffer_shape(  &
            obj%voidptr,  &
            type,  &
            ndims,  &
            shape,  &
            buff%voidptr)
        ! splicer end class.DataView.method.attach_buffer_shape
    end subroutine dataview_attach_buffer_shape
    
    subroutine dataview_apply_nelems(obj, num_elems)
        use iso_c_binding, only : C_LONG
        implicit none
        class(dataview) :: obj
        integer(C_LONG), value, intent(IN) :: num_elems
        ! splicer begin class.DataView.method.apply_nelems
        call c_dataview_apply_nelems(  &
            obj%voidptr,  &
            num_elems)
        ! splicer end class.DataView.method.apply_nelems
    end subroutine dataview_apply_nelems
    
    subroutine dataview_apply_nelems_offset(obj, num_elems, offset)
        use iso_c_binding, only : C_LONG
        implicit none
        class(dataview) :: obj
        integer(C_LONG), value, intent(IN) :: num_elems
        integer(C_LONG), value, intent(IN) :: offset
        ! splicer begin class.DataView.method.apply_nelems_offset
        call c_dataview_apply_nelems_offset(  &
            obj%voidptr,  &
            num_elems,  &
            offset)
        ! splicer end class.DataView.method.apply_nelems_offset
    end subroutine dataview_apply_nelems_offset
    
    subroutine dataview_apply_nelems_offset_stride(obj, num_elems, offset, stride)
        use iso_c_binding, only : C_LONG
        implicit none
        class(dataview) :: obj
        integer(C_LONG), value, intent(IN) :: num_elems
        integer(C_LONG), value, intent(IN) :: offset
        integer(C_LONG), value, intent(IN) :: stride
        ! splicer begin class.DataView.method.apply_nelems_offset_stride
        call c_dataview_apply_nelems_offset_stride(  &
            obj%voidptr,  &
            num_elems,  &
            offset,  &
            stride)
        ! splicer end class.DataView.method.apply_nelems_offset_stride
    end subroutine dataview_apply_nelems_offset_stride
    
    subroutine dataview_apply_type_nelems(obj, type, num_elems)
        use iso_c_binding, only : C_LONG, C_INT
        implicit none
        class(dataview) :: obj
        integer(C_INT), value, intent(IN) :: type
        integer(C_LONG), value, intent(IN) :: num_elems
        ! splicer begin class.DataView.method.apply_type_nelems
        call c_dataview_apply_type_nelems(  &
            obj%voidptr,  &
            type,  &
            num_elems)
        ! splicer end class.DataView.method.apply_type_nelems
    end subroutine dataview_apply_type_nelems
    
    subroutine dataview_apply_type_nelems_offset(obj, type, num_elems, offset)
        use iso_c_binding, only : C_LONG, C_INT
        implicit none
        class(dataview) :: obj
        integer(C_INT), value, intent(IN) :: type
        integer(C_LONG), value, intent(IN) :: num_elems
        integer(C_LONG), value, intent(IN) :: offset
        ! splicer begin class.DataView.method.apply_type_nelems_offset
        call c_dataview_apply_type_nelems_offset(  &
            obj%voidptr,  &
            type,  &
            num_elems,  &
            offset)
        ! splicer end class.DataView.method.apply_type_nelems_offset
    end subroutine dataview_apply_type_nelems_offset
    
    subroutine dataview_apply_type_nelems_offset_stride(obj, type, num_elems, offset, stride)
        use iso_c_binding, only : C_LONG, C_INT
        implicit none
        class(dataview) :: obj
        integer(C_INT), value, intent(IN) :: type
        integer(C_LONG), value, intent(IN) :: num_elems
        integer(C_LONG), value, intent(IN) :: offset
        integer(C_LONG), value, intent(IN) :: stride
        ! splicer begin class.DataView.method.apply_type_nelems_offset_stride
        call c_dataview_apply_type_nelems_offset_stride(  &
            obj%voidptr,  &
            type,  &
            num_elems,  &
            offset,  &
            stride)
        ! splicer end class.DataView.method.apply_type_nelems_offset_stride
    end subroutine dataview_apply_type_nelems_offset_stride
    
    subroutine dataview_apply_type_shape(obj, type, ndims, shape)
        use iso_c_binding, only : C_LONG, C_INT
        implicit none
        class(dataview) :: obj
        integer(C_INT), value, intent(IN) :: type
        integer(C_INT), value, intent(IN) :: ndims
        integer(C_LONG), intent(IN) :: shape(*)
        ! splicer begin class.DataView.method.apply_type_shape
        call c_dataview_apply_type_shape(  &
            obj%voidptr,  &
            type,  &
            ndims,  &
            shape)
        ! splicer end class.DataView.method.apply_type_shape
    end subroutine dataview_apply_type_shape
    
    function dataview_has_buffer(obj) result(rv)
        use iso_c_binding, only : C_BOOL
        implicit none
        class(dataview) :: obj
        logical :: rv
        ! splicer begin class.DataView.method.has_buffer
        rv = c_dataview_has_buffer(obj%voidptr)
        ! splicer end class.DataView.method.has_buffer
    end function dataview_has_buffer
    
    function dataview_is_external(obj) result(rv)
        use iso_c_binding, only : C_BOOL
        implicit none
        class(dataview) :: obj
        logical :: rv
        ! splicer begin class.DataView.method.is_external
        rv = c_dataview_is_external(obj%voidptr)
        ! splicer end class.DataView.method.is_external
    end function dataview_is_external
    
    function dataview_is_applied(obj) result(rv)
        use iso_c_binding, only : C_BOOL
        implicit none
        class(dataview) :: obj
        logical :: rv
        ! splicer begin class.DataView.method.is_applied
        rv = c_dataview_is_applied(obj%voidptr)
        ! splicer end class.DataView.method.is_applied
    end function dataview_is_applied
    
    function dataview_is_described(obj) result(rv)
        use iso_c_binding, only : C_BOOL
        implicit none
        class(dataview) :: obj
        logical :: rv
        ! splicer begin class.DataView.method.is_described
        rv = c_dataview_is_described(obj%voidptr)
        ! splicer end class.DataView.method.is_described
    end function dataview_is_described
    
    function dataview_is_empty(obj) result(rv)
        use iso_c_binding, only : C_BOOL
        implicit none
        class(dataview) :: obj
        logical :: rv
        ! splicer begin class.DataView.method.is_empty
        rv = c_dataview_is_empty(obj%voidptr)
        ! splicer end class.DataView.method.is_empty
    end function dataview_is_empty
    
    function dataview_is_opaque(obj) result(rv)
        use iso_c_binding, only : C_BOOL
        implicit none
        class(dataview) :: obj
        logical :: rv
        ! splicer begin class.DataView.method.is_opaque
        rv = c_dataview_is_opaque(obj%voidptr)
        ! splicer end class.DataView.method.is_opaque
    end function dataview_is_opaque
    
    function dataview_get_name(obj) result(rv)
        use iso_c_binding, only : C_CHAR, C_INT
        implicit none
        class(dataview) :: obj
        character(kind=C_CHAR, len=(MAXNAMESIZE)) :: rv
        ! splicer begin class.DataView.method.get_name
        call c_dataview_get_name_bufferify(  &
            obj%voidptr,  &
            rv,  &
            len(rv, kind=C_INT))
        ! splicer end class.DataView.method.get_name
    end function dataview_get_name
    
    function dataview_get_buffer(obj) result(rv)
        implicit none
        class(dataview) :: obj
        type(databuffer) :: rv
        ! splicer begin class.DataView.method.get_buffer
        rv%voidptr = c_dataview_get_buffer(obj%voidptr)
        ! splicer end class.DataView.method.get_buffer
    end function dataview_get_buffer
    
    function dataview_get_void_ptr(obj) result(rv)
        implicit none
        class(dataview) :: obj
        type(C_PTR) :: rv
        ! splicer begin class.DataView.method.get_void_ptr
        rv = c_dataview_get_void_ptr(obj%voidptr)
        ! splicer end class.DataView.method.get_void_ptr
    end function dataview_get_void_ptr
    
    subroutine dataview_set_scalar_int(obj, value)
        use iso_c_binding, only : C_INT
        implicit none
        class(dataview) :: obj
        integer(C_INT), value, intent(IN) :: value
        ! splicer begin class.DataView.method.set_scalar_int
        call c_dataview_set_scalar_int(  &
            obj%voidptr,  &
            value)
        ! splicer end class.DataView.method.set_scalar_int
    end subroutine dataview_set_scalar_int
    
    subroutine dataview_set_scalar_long(obj, value)
        use iso_c_binding, only : C_LONG
        implicit none
        class(dataview) :: obj
        integer(C_LONG), value, intent(IN) :: value
        ! splicer begin class.DataView.method.set_scalar_long
        call c_dataview_set_scalar_long(  &
            obj%voidptr,  &
            value)
        ! splicer end class.DataView.method.set_scalar_long
    end subroutine dataview_set_scalar_long
    
    subroutine dataview_set_scalar_float(obj, value)
        use iso_c_binding, only : C_FLOAT
        implicit none
        class(dataview) :: obj
        real(C_FLOAT), value, intent(IN) :: value
        ! splicer begin class.DataView.method.set_scalar_float
        call c_dataview_set_scalar_float(  &
            obj%voidptr,  &
            value)
        ! splicer end class.DataView.method.set_scalar_float
    end subroutine dataview_set_scalar_float
    
    subroutine dataview_set_scalar_double(obj, value)
        use iso_c_binding, only : C_DOUBLE
        implicit none
        class(dataview) :: obj
        real(C_DOUBLE), value, intent(IN) :: value
        ! splicer begin class.DataView.method.set_scalar_double
        call c_dataview_set_scalar_double(  &
            obj%voidptr,  &
            value)
        ! splicer end class.DataView.method.set_scalar_double
    end subroutine dataview_set_scalar_double
    
    subroutine dataview_set_external_data_ptr_only(obj, external_ptr)
        implicit none
        class(dataview) :: obj
        type(C_PTR), value, intent(IN) :: external_ptr
        ! splicer begin class.DataView.method.set_external_data_ptr_only
        call c_dataview_set_external_data_ptr_only(  &
            obj%voidptr,  &
            external_ptr)
        ! splicer end class.DataView.method.set_external_data_ptr_only
    end subroutine dataview_set_external_data_ptr_only
    
    subroutine dataview_set_external_data_ptr_type_int(obj, type, num_elems, external_ptr)
        use iso_c_binding, only : C_LONG, C_INT
        implicit none
        class(dataview) :: obj
        integer(C_INT), value, intent(IN) :: type
        integer(C_INT), value, intent(IN) :: num_elems
        type(C_PTR), value, intent(IN) :: external_ptr
        ! splicer begin class.DataView.method.set_external_data_ptr_type_int
        call c_dataview_set_external_data_ptr_type(  &
            obj%voidptr,  &
            type,  &
            int(num_elems, C_LONG),  &
            external_ptr)
        ! splicer end class.DataView.method.set_external_data_ptr_type_int
    end subroutine dataview_set_external_data_ptr_type_int
    
    subroutine dataview_set_external_data_ptr_type_long(obj, type, num_elems, external_ptr)
        use iso_c_binding, only : C_LONG, C_INT
        implicit none
        class(dataview) :: obj
        integer(C_INT), value, intent(IN) :: type
        integer(C_LONG), value, intent(IN) :: num_elems
        type(C_PTR), value, intent(IN) :: external_ptr
        ! splicer begin class.DataView.method.set_external_data_ptr_type_long
        call c_dataview_set_external_data_ptr_type(  &
            obj%voidptr,  &
            type,  &
            int(num_elems, C_LONG),  &
            external_ptr)
        ! splicer end class.DataView.method.set_external_data_ptr_type_long
    end subroutine dataview_set_external_data_ptr_type_long
    
    subroutine dataview_set_external_data_ptr_shape(obj, type, ndims, shape, external_ptr)
        use iso_c_binding, only : C_LONG, C_INT
        implicit none
        class(dataview) :: obj
        integer(C_INT), value, intent(IN) :: type
        integer(C_INT), value, intent(IN) :: ndims
        integer(C_LONG), intent(IN) :: shape(*)
        type(C_PTR), value, intent(IN) :: external_ptr
        ! splicer begin class.DataView.method.set_external_data_ptr_shape
        call c_dataview_set_external_data_ptr_shape(  &
            obj%voidptr,  &
            type,  &
            ndims,  &
            shape,  &
            external_ptr)
        ! splicer end class.DataView.method.set_external_data_ptr_shape
    end subroutine dataview_set_external_data_ptr_shape
    
    subroutine dataview_get_string(obj, name)
        use iso_c_binding, only : C_INT
        implicit none
        class(dataview) :: obj
        character(*), intent(OUT) :: name
        ! splicer begin class.DataView.method.get_string
        call c_dataview_get_string_bufferify(  &
            obj%voidptr,  &
            name,  &
            len(name, kind=C_INT))
        ! splicer end class.DataView.method.get_string
    end subroutine dataview_get_string
    
    function dataview_get_data_int(obj) result(rv)
        use iso_c_binding, only : C_INT
        implicit none
        class(dataview) :: obj
        integer(C_INT) :: rv
        ! splicer begin class.DataView.method.get_data_int
        rv = c_dataview_get_data_int(obj%voidptr)
        ! splicer end class.DataView.method.get_data_int
    end function dataview_get_data_int
    
    function dataview_get_data_long(obj) result(rv)
        use iso_c_binding, only : C_LONG
        implicit none
        class(dataview) :: obj
        integer(C_LONG) :: rv
        ! splicer begin class.DataView.method.get_data_long
        rv = c_dataview_get_data_long(obj%voidptr)
        ! splicer end class.DataView.method.get_data_long
    end function dataview_get_data_long
    
    function dataview_get_data_float(obj) result(rv)
        use iso_c_binding, only : C_FLOAT
        implicit none
        class(dataview) :: obj
        real(C_FLOAT) :: rv
        ! splicer begin class.DataView.method.get_data_float
        rv = c_dataview_get_data_float(obj%voidptr)
        ! splicer end class.DataView.method.get_data_float
    end function dataview_get_data_float
    
    function dataview_get_data_double(obj) result(rv)
        use iso_c_binding, only : C_DOUBLE
        implicit none
        class(dataview) :: obj
        real(C_DOUBLE) :: rv
        ! splicer begin class.DataView.method.get_data_double
        rv = c_dataview_get_data_double(obj%voidptr)
        ! splicer end class.DataView.method.get_data_double
    end function dataview_get_data_double
    
    function dataview_get_owning_group(obj) result(rv)
        implicit none
        class(dataview) :: obj
        type(datagroup) :: rv
        ! splicer begin class.DataView.method.get_owning_group
        rv%voidptr = c_dataview_get_owning_group(obj%voidptr)
        ! splicer end class.DataView.method.get_owning_group
    end function dataview_get_owning_group
    
    function dataview_get_type_id(obj) result(rv)
        use iso_c_binding, only : C_INT
        implicit none
        class(dataview) :: obj
        integer(C_INT) :: rv
        ! splicer begin class.DataView.method.get_type_id
        rv = c_dataview_get_type_id(obj%voidptr)
        ! splicer end class.DataView.method.get_type_id
    end function dataview_get_type_id
    
    function dataview_get_total_bytes(obj) result(rv)
        use iso_c_binding, only : C_SIZE_T
        implicit none
        class(dataview) :: obj
        integer(C_SIZE_T) :: rv
        ! splicer begin class.DataView.method.get_total_bytes
        rv = c_dataview_get_total_bytes(obj%voidptr)
        ! splicer end class.DataView.method.get_total_bytes
    end function dataview_get_total_bytes
    
    function dataview_get_num_elements(obj) result(rv)
        use iso_c_binding, only : C_SIZE_T
        implicit none
        class(dataview) :: obj
        integer(C_SIZE_T) :: rv
        ! splicer begin class.DataView.method.get_num_elements
        rv = c_dataview_get_num_elements(obj%voidptr)
        ! splicer end class.DataView.method.get_num_elements
    end function dataview_get_num_elements
    
    function dataview_get_num_dimensions(obj) result(rv)
        use iso_c_binding, only : C_INT
        implicit none
        class(dataview) :: obj
        integer(C_INT) :: rv
        ! splicer begin class.DataView.method.get_num_dimensions
        rv = c_dataview_get_num_dimensions(obj%voidptr)
        ! splicer end class.DataView.method.get_num_dimensions
    end function dataview_get_num_dimensions
    
    function dataview_get_shape(obj, ndims, shape) result(rv)
        use iso_c_binding, only : C_LONG, C_INT
        implicit none
        class(dataview) :: obj
        integer(C_INT), value, intent(IN) :: ndims
        integer(C_LONG), intent(IN) :: shape(*)
        integer(C_INT) :: rv
        ! splicer begin class.DataView.method.get_shape
        rv = c_dataview_get_shape(  &
            obj%voidptr,  &
            ndims,  &
            shape)
        ! splicer end class.DataView.method.get_shape
    end function dataview_get_shape
    
    subroutine dataview_print(obj)
        implicit none
        class(dataview) :: obj
        ! splicer begin class.DataView.method.print
        call c_dataview_print(obj%voidptr)
        ! splicer end class.DataView.method.print
    end subroutine dataview_print
    
    function dataview_get_instance(obj) result (voidptr)
        use iso_c_binding, only: C_PTR
        implicit none
        class(dataview), intent(IN) :: obj
        type(C_PTR) :: voidptr
        voidptr = obj%voidptr
    end function dataview_get_instance
    
    subroutine dataview_set_instance(obj, voidptr)
        use iso_c_binding, only: C_PTR
        implicit none
        class(dataview), intent(INOUT) :: obj
        type(C_PTR), intent(IN) :: voidptr
        obj%voidptr = voidptr
    end subroutine dataview_set_instance
    
    function dataview_associated(obj) result (rv)
        use iso_c_binding, only: c_associated
        implicit none
        class(dataview), intent(IN) :: obj
        logical rv
        rv = c_associated(obj%voidptr)
    end function dataview_associated
    
    ! splicer begin class.DataView.additional_functions
    
    ! Generated by genfsidresplicer.py
    subroutine dataview_get_data_int_scalar_ptr(view, value)
        use iso_c_binding
        implicit none
        class(dataview), intent(IN) :: view
        integer(C_INT), pointer, intent(OUT) :: value
        type(C_PTR) cptr
    
        cptr = view%get_void_ptr()
        if (c_associated(cptr)) then
          call c_f_pointer(cptr, value)
        else
          nullify(value)
        endif
    end subroutine dataview_get_data_int_scalar_ptr
    
    ! Generated by genfsidresplicer.py
    subroutine dataview_get_data_int_1d_ptr(view, value)
        use iso_c_binding
        implicit none
        class(dataview), intent(IN) :: view
        integer(C_INT), pointer, intent(OUT) :: value(:)
        type(C_PTR) cptr
        integer rank
        integer(SIDRE_LENGTH) extents(1)
    
        cptr = view%get_void_ptr()
        if (c_associated(cptr)) then
          rank = view%get_shape(1, extents)
          call c_f_pointer(cptr, value, extents)
        else
          nullify(value)
        endif
    end subroutine dataview_get_data_int_1d_ptr
    
    ! Generated by genfsidresplicer.py
    subroutine dataview_get_data_int_2d_ptr(view, value)
        use iso_c_binding
        implicit none
        class(dataview), intent(IN) :: view
        integer(C_INT), pointer, intent(OUT) :: value(:,:)
        type(C_PTR) cptr
        integer rank
        integer(SIDRE_LENGTH) extents(2)
    
        cptr = view%get_void_ptr()
        if (c_associated(cptr)) then
          rank = view%get_shape(2, extents)
          call c_f_pointer(cptr, value, extents)
        else
          nullify(value)
        endif
    end subroutine dataview_get_data_int_2d_ptr
    
    ! Generated by genfsidresplicer.py
    subroutine dataview_get_data_int_3d_ptr(view, value)
        use iso_c_binding
        implicit none
        class(dataview), intent(IN) :: view
        integer(C_INT), pointer, intent(OUT) :: value(:,:,:)
        type(C_PTR) cptr
        integer rank
        integer(SIDRE_LENGTH) extents(3)
    
        cptr = view%get_void_ptr()
        if (c_associated(cptr)) then
          rank = view%get_shape(3, extents)
          call c_f_pointer(cptr, value, extents)
        else
          nullify(value)
        endif
    end subroutine dataview_get_data_int_3d_ptr
    
    ! Generated by genfsidresplicer.py
    subroutine dataview_get_data_int_4d_ptr(view, value)
        use iso_c_binding
        implicit none
        class(dataview), intent(IN) :: view
        integer(C_INT), pointer, intent(OUT) :: value(:,:,:,:)
        type(C_PTR) cptr
        integer rank
        integer(SIDRE_LENGTH) extents(4)
    
        cptr = view%get_void_ptr()
        if (c_associated(cptr)) then
          rank = view%get_shape(4, extents)
          call c_f_pointer(cptr, value, extents)
        else
          nullify(value)
        endif
    end subroutine dataview_get_data_int_4d_ptr
    
    ! Generated by genfsidresplicer.py
    subroutine dataview_get_data_long_scalar_ptr(view, value)
        use iso_c_binding
        implicit none
        class(dataview), intent(IN) :: view
        integer(C_LONG), pointer, intent(OUT) :: value
        type(C_PTR) cptr
    
        cptr = view%get_void_ptr()
        if (c_associated(cptr)) then
          call c_f_pointer(cptr, value)
        else
          nullify(value)
        endif
    end subroutine dataview_get_data_long_scalar_ptr
    
    ! Generated by genfsidresplicer.py
    subroutine dataview_get_data_long_1d_ptr(view, value)
        use iso_c_binding
        implicit none
        class(dataview), intent(IN) :: view
        integer(C_LONG), pointer, intent(OUT) :: value(:)
        type(C_PTR) cptr
        integer rank
        integer(SIDRE_LENGTH) extents(1)
    
        cptr = view%get_void_ptr()
        if (c_associated(cptr)) then
          rank = view%get_shape(1, extents)
          call c_f_pointer(cptr, value, extents)
        else
          nullify(value)
        endif
    end subroutine dataview_get_data_long_1d_ptr
    
    ! Generated by genfsidresplicer.py
    subroutine dataview_get_data_long_2d_ptr(view, value)
        use iso_c_binding
        implicit none
        class(dataview), intent(IN) :: view
        integer(C_LONG), pointer, intent(OUT) :: value(:,:)
        type(C_PTR) cptr
        integer rank
        integer(SIDRE_LENGTH) extents(2)
    
        cptr = view%get_void_ptr()
        if (c_associated(cptr)) then
          rank = view%get_shape(2, extents)
          call c_f_pointer(cptr, value, extents)
        else
          nullify(value)
        endif
    end subroutine dataview_get_data_long_2d_ptr
    
    ! Generated by genfsidresplicer.py
    subroutine dataview_get_data_long_3d_ptr(view, value)
        use iso_c_binding
        implicit none
        class(dataview), intent(IN) :: view
        integer(C_LONG), pointer, intent(OUT) :: value(:,:,:)
        type(C_PTR) cptr
        integer rank
        integer(SIDRE_LENGTH) extents(3)
    
        cptr = view%get_void_ptr()
        if (c_associated(cptr)) then
          rank = view%get_shape(3, extents)
          call c_f_pointer(cptr, value, extents)
        else
          nullify(value)
        endif
    end subroutine dataview_get_data_long_3d_ptr
    
    ! Generated by genfsidresplicer.py
    subroutine dataview_get_data_long_4d_ptr(view, value)
        use iso_c_binding
        implicit none
        class(dataview), intent(IN) :: view
        integer(C_LONG), pointer, intent(OUT) :: value(:,:,:,:)
        type(C_PTR) cptr
        integer rank
        integer(SIDRE_LENGTH) extents(4)
    
        cptr = view%get_void_ptr()
        if (c_associated(cptr)) then
          rank = view%get_shape(4, extents)
          call c_f_pointer(cptr, value, extents)
        else
          nullify(value)
        endif
    end subroutine dataview_get_data_long_4d_ptr
    
    ! Generated by genfsidresplicer.py
    subroutine dataview_get_data_float_scalar_ptr(view, value)
        use iso_c_binding
        implicit none
        class(dataview), intent(IN) :: view
        real(C_FLOAT), pointer, intent(OUT) :: value
        type(C_PTR) cptr
    
        cptr = view%get_void_ptr()
        if (c_associated(cptr)) then
          call c_f_pointer(cptr, value)
        else
          nullify(value)
        endif
    end subroutine dataview_get_data_float_scalar_ptr
    
    ! Generated by genfsidresplicer.py
    subroutine dataview_get_data_float_1d_ptr(view, value)
        use iso_c_binding
        implicit none
        class(dataview), intent(IN) :: view
        real(C_FLOAT), pointer, intent(OUT) :: value(:)
        type(C_PTR) cptr
        integer rank
        integer(SIDRE_LENGTH) extents(1)
    
        cptr = view%get_void_ptr()
        if (c_associated(cptr)) then
          rank = view%get_shape(1, extents)
          call c_f_pointer(cptr, value, extents)
        else
          nullify(value)
        endif
    end subroutine dataview_get_data_float_1d_ptr
    
    ! Generated by genfsidresplicer.py
    subroutine dataview_get_data_float_2d_ptr(view, value)
        use iso_c_binding
        implicit none
        class(dataview), intent(IN) :: view
        real(C_FLOAT), pointer, intent(OUT) :: value(:,:)
        type(C_PTR) cptr
        integer rank
        integer(SIDRE_LENGTH) extents(2)
    
        cptr = view%get_void_ptr()
        if (c_associated(cptr)) then
          rank = view%get_shape(2, extents)
          call c_f_pointer(cptr, value, extents)
        else
          nullify(value)
        endif
    end subroutine dataview_get_data_float_2d_ptr
    
    ! Generated by genfsidresplicer.py
    subroutine dataview_get_data_float_3d_ptr(view, value)
        use iso_c_binding
        implicit none
        class(dataview), intent(IN) :: view
        real(C_FLOAT), pointer, intent(OUT) :: value(:,:,:)
        type(C_PTR) cptr
        integer rank
        integer(SIDRE_LENGTH) extents(3)
    
        cptr = view%get_void_ptr()
        if (c_associated(cptr)) then
          rank = view%get_shape(3, extents)
          call c_f_pointer(cptr, value, extents)
        else
          nullify(value)
        endif
    end subroutine dataview_get_data_float_3d_ptr
    
    ! Generated by genfsidresplicer.py
    subroutine dataview_get_data_float_4d_ptr(view, value)
        use iso_c_binding
        implicit none
        class(dataview), intent(IN) :: view
        real(C_FLOAT), pointer, intent(OUT) :: value(:,:,:,:)
        type(C_PTR) cptr
        integer rank
        integer(SIDRE_LENGTH) extents(4)
    
        cptr = view%get_void_ptr()
        if (c_associated(cptr)) then
          rank = view%get_shape(4, extents)
          call c_f_pointer(cptr, value, extents)
        else
          nullify(value)
        endif
    end subroutine dataview_get_data_float_4d_ptr
    
    ! Generated by genfsidresplicer.py
    subroutine dataview_get_data_double_scalar_ptr(view, value)
        use iso_c_binding
        implicit none
        class(dataview), intent(IN) :: view
        real(C_DOUBLE), pointer, intent(OUT) :: value
        type(C_PTR) cptr
    
        cptr = view%get_void_ptr()
        if (c_associated(cptr)) then
          call c_f_pointer(cptr, value)
        else
          nullify(value)
        endif
    end subroutine dataview_get_data_double_scalar_ptr
    
    ! Generated by genfsidresplicer.py
    subroutine dataview_get_data_double_1d_ptr(view, value)
        use iso_c_binding
        implicit none
        class(dataview), intent(IN) :: view
        real(C_DOUBLE), pointer, intent(OUT) :: value(:)
        type(C_PTR) cptr
        integer rank
        integer(SIDRE_LENGTH) extents(1)
    
        cptr = view%get_void_ptr()
        if (c_associated(cptr)) then
          rank = view%get_shape(1, extents)
          call c_f_pointer(cptr, value, extents)
        else
          nullify(value)
        endif
    end subroutine dataview_get_data_double_1d_ptr
    
    ! Generated by genfsidresplicer.py
    subroutine dataview_get_data_double_2d_ptr(view, value)
        use iso_c_binding
        implicit none
        class(dataview), intent(IN) :: view
        real(C_DOUBLE), pointer, intent(OUT) :: value(:,:)
        type(C_PTR) cptr
        integer rank
        integer(SIDRE_LENGTH) extents(2)
    
        cptr = view%get_void_ptr()
        if (c_associated(cptr)) then
          rank = view%get_shape(2, extents)
          call c_f_pointer(cptr, value, extents)
        else
          nullify(value)
        endif
    end subroutine dataview_get_data_double_2d_ptr
    
    ! Generated by genfsidresplicer.py
    subroutine dataview_get_data_double_3d_ptr(view, value)
        use iso_c_binding
        implicit none
        class(dataview), intent(IN) :: view
        real(C_DOUBLE), pointer, intent(OUT) :: value(:,:,:)
        type(C_PTR) cptr
        integer rank
        integer(SIDRE_LENGTH) extents(3)
    
        cptr = view%get_void_ptr()
        if (c_associated(cptr)) then
          rank = view%get_shape(3, extents)
          call c_f_pointer(cptr, value, extents)
        else
          nullify(value)
        endif
    end subroutine dataview_get_data_double_3d_ptr
    
    ! Generated by genfsidresplicer.py
    subroutine dataview_get_data_double_4d_ptr(view, value)
        use iso_c_binding
        implicit none
        class(dataview), intent(IN) :: view
        real(C_DOUBLE), pointer, intent(OUT) :: value(:,:,:,:)
        type(C_PTR) cptr
        integer rank
        integer(SIDRE_LENGTH) extents(4)
    
        cptr = view%get_void_ptr()
        if (c_associated(cptr)) then
          rank = view%get_shape(4, extents)
          call c_f_pointer(cptr, value, extents)
        else
          nullify(value)
        endif
    end subroutine dataview_get_data_double_4d_ptr
    
    ! Generated by genfsidresplicer.py
    subroutine dataview_set_array_data_ptr_int_scalar(view, value)
        use iso_c_binding
        implicit none
    
        class(dataview), intent(IN) :: view
        integer(C_INT), target, intent(IN) :: value
    !    integer(SIDRE_LENGTH) :: extents(1)
    !    integer(C_INT), parameter :: type = SIDRE_INT_ID
        type(C_PTR) addr
    
    !    lname = len_trim(name)
    !    extents(1) = 1_SIDRE_LENGTH
        call SHROUD_C_LOC(value, addr)
        call c_dataview_set_external_data_ptr_only(view%voidptr, addr)
    !    call c_dataview_apply_type_shape(rv%voidptr, type, 0, extents)
    end subroutine dataview_set_array_data_ptr_int_scalar
    
    ! Generated by genfsidresplicer.py
    subroutine dataview_set_array_data_ptr_int_1d(view, value)
        use iso_c_binding
        implicit none
    
        class(dataview), intent(IN) :: view
        integer(C_INT), target, intent(IN) :: value(:)
    !    integer(SIDRE_LENGTH) :: extents(1)
    !    integer(C_INT), parameter :: type = SIDRE_INT_ID
        type(C_PTR) addr
    
    !    lname = len_trim(name)
    !    extents = shape(value, kind=SIDRE_LENGTH)
        call SHROUD_C_LOC(value, addr)
        call c_dataview_set_external_data_ptr_only(view%voidptr, addr)
    !    call c_dataview_apply_type_shape(rv%voidptr, type, 1, extents)
    end subroutine dataview_set_array_data_ptr_int_1d
    
    ! Generated by genfsidresplicer.py
    subroutine dataview_set_array_data_ptr_int_2d(view, value)
        use iso_c_binding
        implicit none
    
        class(dataview), intent(IN) :: view
        integer(C_INT), target, intent(IN) :: value(:,:)
    !    integer(SIDRE_LENGTH) :: extents(2)
    !    integer(C_INT), parameter :: type = SIDRE_INT_ID
        type(C_PTR) addr
    
    !    lname = len_trim(name)
    !    extents = shape(value, kind=SIDRE_LENGTH)
        call SHROUD_C_LOC(value, addr)
        call c_dataview_set_external_data_ptr_only(view%voidptr, addr)
    !    call c_dataview_apply_type_shape(rv%voidptr, type, 2, extents)
    end subroutine dataview_set_array_data_ptr_int_2d
    
    ! Generated by genfsidresplicer.py
    subroutine dataview_set_array_data_ptr_int_3d(view, value)
        use iso_c_binding
        implicit none
    
        class(dataview), intent(IN) :: view
        integer(C_INT), target, intent(IN) :: value(:,:,:)
    !    integer(SIDRE_LENGTH) :: extents(3)
    !    integer(C_INT), parameter :: type = SIDRE_INT_ID
        type(C_PTR) addr
    
    !    lname = len_trim(name)
    !    extents = shape(value, kind=SIDRE_LENGTH)
        call SHROUD_C_LOC(value, addr)
        call c_dataview_set_external_data_ptr_only(view%voidptr, addr)
    !    call c_dataview_apply_type_shape(rv%voidptr, type, 3, extents)
    end subroutine dataview_set_array_data_ptr_int_3d
    
    ! Generated by genfsidresplicer.py
    subroutine dataview_set_array_data_ptr_int_4d(view, value)
        use iso_c_binding
        implicit none
    
        class(dataview), intent(IN) :: view
        integer(C_INT), target, intent(IN) :: value(:,:,:,:)
    !    integer(SIDRE_LENGTH) :: extents(4)
    !    integer(C_INT), parameter :: type = SIDRE_INT_ID
        type(C_PTR) addr
    
    !    lname = len_trim(name)
    !    extents = shape(value, kind=SIDRE_LENGTH)
        call SHROUD_C_LOC(value, addr)
        call c_dataview_set_external_data_ptr_only(view%voidptr, addr)
    !    call c_dataview_apply_type_shape(rv%voidptr, type, 4, extents)
    end subroutine dataview_set_array_data_ptr_int_4d
    
    ! Generated by genfsidresplicer.py
    subroutine dataview_set_array_data_ptr_long_scalar(view, value)
        use iso_c_binding
        implicit none
    
        class(dataview), intent(IN) :: view
        integer(C_LONG), target, intent(IN) :: value
    !    integer(SIDRE_LENGTH) :: extents(1)
    !    integer(C_INT), parameter :: type = SIDRE_LONG_ID
        type(C_PTR) addr
    
    !    lname = len_trim(name)
    !    extents(1) = 1_SIDRE_LENGTH
        call SHROUD_C_LOC(value, addr)
        call c_dataview_set_external_data_ptr_only(view%voidptr, addr)
    !    call c_dataview_apply_type_shape(rv%voidptr, type, 0, extents)
    end subroutine dataview_set_array_data_ptr_long_scalar
    
    ! Generated by genfsidresplicer.py
    subroutine dataview_set_array_data_ptr_long_1d(view, value)
        use iso_c_binding
        implicit none
    
        class(dataview), intent(IN) :: view
        integer(C_LONG), target, intent(IN) :: value(:)
    !    integer(SIDRE_LENGTH) :: extents(1)
    !    integer(C_INT), parameter :: type = SIDRE_LONG_ID
        type(C_PTR) addr
    
    !    lname = len_trim(name)
    !    extents = shape(value, kind=SIDRE_LENGTH)
        call SHROUD_C_LOC(value, addr)
        call c_dataview_set_external_data_ptr_only(view%voidptr, addr)
    !    call c_dataview_apply_type_shape(rv%voidptr, type, 1, extents)
    end subroutine dataview_set_array_data_ptr_long_1d
    
    ! Generated by genfsidresplicer.py
    subroutine dataview_set_array_data_ptr_long_2d(view, value)
        use iso_c_binding
        implicit none
    
        class(dataview), intent(IN) :: view
        integer(C_LONG), target, intent(IN) :: value(:,:)
    !    integer(SIDRE_LENGTH) :: extents(2)
    !    integer(C_INT), parameter :: type = SIDRE_LONG_ID
        type(C_PTR) addr
    
    !    lname = len_trim(name)
    !    extents = shape(value, kind=SIDRE_LENGTH)
        call SHROUD_C_LOC(value, addr)
        call c_dataview_set_external_data_ptr_only(view%voidptr, addr)
    !    call c_dataview_apply_type_shape(rv%voidptr, type, 2, extents)
    end subroutine dataview_set_array_data_ptr_long_2d
    
    ! Generated by genfsidresplicer.py
    subroutine dataview_set_array_data_ptr_long_3d(view, value)
        use iso_c_binding
        implicit none
    
        class(dataview), intent(IN) :: view
        integer(C_LONG), target, intent(IN) :: value(:,:,:)
    !    integer(SIDRE_LENGTH) :: extents(3)
    !    integer(C_INT), parameter :: type = SIDRE_LONG_ID
        type(C_PTR) addr
    
    !    lname = len_trim(name)
    !    extents = shape(value, kind=SIDRE_LENGTH)
        call SHROUD_C_LOC(value, addr)
        call c_dataview_set_external_data_ptr_only(view%voidptr, addr)
    !    call c_dataview_apply_type_shape(rv%voidptr, type, 3, extents)
    end subroutine dataview_set_array_data_ptr_long_3d
    
    ! Generated by genfsidresplicer.py
    subroutine dataview_set_array_data_ptr_long_4d(view, value)
        use iso_c_binding
        implicit none
    
        class(dataview), intent(IN) :: view
        integer(C_LONG), target, intent(IN) :: value(:,:,:,:)
    !    integer(SIDRE_LENGTH) :: extents(4)
    !    integer(C_INT), parameter :: type = SIDRE_LONG_ID
        type(C_PTR) addr
    
    !    lname = len_trim(name)
    !    extents = shape(value, kind=SIDRE_LENGTH)
        call SHROUD_C_LOC(value, addr)
        call c_dataview_set_external_data_ptr_only(view%voidptr, addr)
    !    call c_dataview_apply_type_shape(rv%voidptr, type, 4, extents)
    end subroutine dataview_set_array_data_ptr_long_4d
    
    ! Generated by genfsidresplicer.py
    subroutine dataview_set_array_data_ptr_float_scalar(view, value)
        use iso_c_binding
        implicit none
    
        class(dataview), intent(IN) :: view
        real(C_FLOAT), target, intent(IN) :: value
    !    integer(SIDRE_LENGTH) :: extents(1)
    !    integer(C_INT), parameter :: type = SIDRE_FLOAT_ID
        type(C_PTR) addr
    
    !    lname = len_trim(name)
    !    extents(1) = 1_SIDRE_LENGTH
        call SHROUD_C_LOC(value, addr)
        call c_dataview_set_external_data_ptr_only(view%voidptr, addr)
    !    call c_dataview_apply_type_shape(rv%voidptr, type, 0, extents)
    end subroutine dataview_set_array_data_ptr_float_scalar
    
    ! Generated by genfsidresplicer.py
    subroutine dataview_set_array_data_ptr_float_1d(view, value)
        use iso_c_binding
        implicit none
    
        class(dataview), intent(IN) :: view
        real(C_FLOAT), target, intent(IN) :: value(:)
    !    integer(SIDRE_LENGTH) :: extents(1)
    !    integer(C_INT), parameter :: type = SIDRE_FLOAT_ID
        type(C_PTR) addr
    
    !    lname = len_trim(name)
    !    extents = shape(value, kind=SIDRE_LENGTH)
        call SHROUD_C_LOC(value, addr)
        call c_dataview_set_external_data_ptr_only(view%voidptr, addr)
    !    call c_dataview_apply_type_shape(rv%voidptr, type, 1, extents)
    end subroutine dataview_set_array_data_ptr_float_1d
    
    ! Generated by genfsidresplicer.py
    subroutine dataview_set_array_data_ptr_float_2d(view, value)
        use iso_c_binding
        implicit none
    
        class(dataview), intent(IN) :: view
        real(C_FLOAT), target, intent(IN) :: value(:,:)
    !    integer(SIDRE_LENGTH) :: extents(2)
    !    integer(C_INT), parameter :: type = SIDRE_FLOAT_ID
        type(C_PTR) addr
    
    !    lname = len_trim(name)
    !    extents = shape(value, kind=SIDRE_LENGTH)
        call SHROUD_C_LOC(value, addr)
        call c_dataview_set_external_data_ptr_only(view%voidptr, addr)
    !    call c_dataview_apply_type_shape(rv%voidptr, type, 2, extents)
    end subroutine dataview_set_array_data_ptr_float_2d
    
    ! Generated by genfsidresplicer.py
    subroutine dataview_set_array_data_ptr_float_3d(view, value)
        use iso_c_binding
        implicit none
    
        class(dataview), intent(IN) :: view
        real(C_FLOAT), target, intent(IN) :: value(:,:,:)
    !    integer(SIDRE_LENGTH) :: extents(3)
    !    integer(C_INT), parameter :: type = SIDRE_FLOAT_ID
        type(C_PTR) addr
    
    !    lname = len_trim(name)
    !    extents = shape(value, kind=SIDRE_LENGTH)
        call SHROUD_C_LOC(value, addr)
        call c_dataview_set_external_data_ptr_only(view%voidptr, addr)
    !    call c_dataview_apply_type_shape(rv%voidptr, type, 3, extents)
    end subroutine dataview_set_array_data_ptr_float_3d
    
    ! Generated by genfsidresplicer.py
    subroutine dataview_set_array_data_ptr_float_4d(view, value)
        use iso_c_binding
        implicit none
    
        class(dataview), intent(IN) :: view
        real(C_FLOAT), target, intent(IN) :: value(:,:,:,:)
    !    integer(SIDRE_LENGTH) :: extents(4)
    !    integer(C_INT), parameter :: type = SIDRE_FLOAT_ID
        type(C_PTR) addr
    
    !    lname = len_trim(name)
    !    extents = shape(value, kind=SIDRE_LENGTH)
        call SHROUD_C_LOC(value, addr)
        call c_dataview_set_external_data_ptr_only(view%voidptr, addr)
    !    call c_dataview_apply_type_shape(rv%voidptr, type, 4, extents)
    end subroutine dataview_set_array_data_ptr_float_4d
    
    ! Generated by genfsidresplicer.py
    subroutine dataview_set_array_data_ptr_double_scalar(view, value)
        use iso_c_binding
        implicit none
    
        class(dataview), intent(IN) :: view
        real(C_DOUBLE), target, intent(IN) :: value
    !    integer(SIDRE_LENGTH) :: extents(1)
    !    integer(C_INT), parameter :: type = SIDRE_DOUBLE_ID
        type(C_PTR) addr
    
    !    lname = len_trim(name)
    !    extents(1) = 1_SIDRE_LENGTH
        call SHROUD_C_LOC(value, addr)
        call c_dataview_set_external_data_ptr_only(view%voidptr, addr)
    !    call c_dataview_apply_type_shape(rv%voidptr, type, 0, extents)
    end subroutine dataview_set_array_data_ptr_double_scalar
    
    ! Generated by genfsidresplicer.py
    subroutine dataview_set_array_data_ptr_double_1d(view, value)
        use iso_c_binding
        implicit none
    
        class(dataview), intent(IN) :: view
        real(C_DOUBLE), target, intent(IN) :: value(:)
    !    integer(SIDRE_LENGTH) :: extents(1)
    !    integer(C_INT), parameter :: type = SIDRE_DOUBLE_ID
        type(C_PTR) addr
    
    !    lname = len_trim(name)
    !    extents = shape(value, kind=SIDRE_LENGTH)
        call SHROUD_C_LOC(value, addr)
        call c_dataview_set_external_data_ptr_only(view%voidptr, addr)
    !    call c_dataview_apply_type_shape(rv%voidptr, type, 1, extents)
    end subroutine dataview_set_array_data_ptr_double_1d
    
    ! Generated by genfsidresplicer.py
    subroutine dataview_set_array_data_ptr_double_2d(view, value)
        use iso_c_binding
        implicit none
    
        class(dataview), intent(IN) :: view
        real(C_DOUBLE), target, intent(IN) :: value(:,:)
    !    integer(SIDRE_LENGTH) :: extents(2)
    !    integer(C_INT), parameter :: type = SIDRE_DOUBLE_ID
        type(C_PTR) addr
    
    !    lname = len_trim(name)
    !    extents = shape(value, kind=SIDRE_LENGTH)
        call SHROUD_C_LOC(value, addr)
        call c_dataview_set_external_data_ptr_only(view%voidptr, addr)
    !    call c_dataview_apply_type_shape(rv%voidptr, type, 2, extents)
    end subroutine dataview_set_array_data_ptr_double_2d
    
    ! Generated by genfsidresplicer.py
    subroutine dataview_set_array_data_ptr_double_3d(view, value)
        use iso_c_binding
        implicit none
    
        class(dataview), intent(IN) :: view
        real(C_DOUBLE), target, intent(IN) :: value(:,:,:)
    !    integer(SIDRE_LENGTH) :: extents(3)
    !    integer(C_INT), parameter :: type = SIDRE_DOUBLE_ID
        type(C_PTR) addr
    
    !    lname = len_trim(name)
    !    extents = shape(value, kind=SIDRE_LENGTH)
        call SHROUD_C_LOC(value, addr)
        call c_dataview_set_external_data_ptr_only(view%voidptr, addr)
    !    call c_dataview_apply_type_shape(rv%voidptr, type, 3, extents)
    end subroutine dataview_set_array_data_ptr_double_3d
    
    ! Generated by genfsidresplicer.py
    subroutine dataview_set_array_data_ptr_double_4d(view, value)
        use iso_c_binding
        implicit none
    
        class(dataview), intent(IN) :: view
        real(C_DOUBLE), target, intent(IN) :: value(:,:,:,:)
    !    integer(SIDRE_LENGTH) :: extents(4)
    !    integer(C_INT), parameter :: type = SIDRE_DOUBLE_ID
        type(C_PTR) addr
    
    !    lname = len_trim(name)
    !    extents = shape(value, kind=SIDRE_LENGTH)
        call SHROUD_C_LOC(value, addr)
        call c_dataview_set_external_data_ptr_only(view%voidptr, addr)
    !    call c_dataview_apply_type_shape(rv%voidptr, type, 4, extents)
    end subroutine dataview_set_array_data_ptr_double_4d
    ! splicer end class.DataView.additional_functions
    
    function name_is_valid(name) result(rv)
        use iso_c_binding, only : C_BOOL
        implicit none
        character(*), intent(IN) :: name
        logical :: rv
        ! splicer begin name_is_valid
        rv = name .ne. " "
        ! splicer end name_is_valid
    end function name_is_valid
    
    ! splicer begin additional_functions
    ! splicer end additional_functions
    
    function datastore_eq(a,b) result (rv)
        use iso_c_binding, only: c_associated
        implicit none
        type(datastore), intent(IN) ::a,b
        logical :: rv
        if (c_associated(a%voidptr, b%voidptr)) then
            rv = .true.
        else
            rv = .false.
        endif
    end function datastore_eq
    
    function datastore_ne(a,b) result (rv)
        use iso_c_binding, only: c_associated
        implicit none
        type(datastore), intent(IN) ::a,b
        logical :: rv
        if (.not. c_associated(a%voidptr, b%voidptr)) then
            rv = .true.
        else
            rv = .false.
        endif
    end function datastore_ne
    
    function datagroup_eq(a,b) result (rv)
        use iso_c_binding, only: c_associated
        implicit none
        type(datagroup), intent(IN) ::a,b
        logical :: rv
        if (c_associated(a%voidptr, b%voidptr)) then
            rv = .true.
        else
            rv = .false.
        endif
    end function datagroup_eq
    
    function datagroup_ne(a,b) result (rv)
        use iso_c_binding, only: c_associated
        implicit none
        type(datagroup), intent(IN) ::a,b
        logical :: rv
        if (.not. c_associated(a%voidptr, b%voidptr)) then
            rv = .true.
        else
            rv = .false.
        endif
    end function datagroup_ne
    
    function databuffer_eq(a,b) result (rv)
        use iso_c_binding, only: c_associated
        implicit none
        type(databuffer), intent(IN) ::a,b
        logical :: rv
        if (c_associated(a%voidptr, b%voidptr)) then
            rv = .true.
        else
            rv = .false.
        endif
    end function databuffer_eq
    
    function databuffer_ne(a,b) result (rv)
        use iso_c_binding, only: c_associated
        implicit none
        type(databuffer), intent(IN) ::a,b
        logical :: rv
        if (.not. c_associated(a%voidptr, b%voidptr)) then
            rv = .true.
        else
            rv = .false.
        endif
    end function databuffer_ne
    
    function dataview_eq(a,b) result (rv)
        use iso_c_binding, only: c_associated
        implicit none
        type(dataview), intent(IN) ::a,b
        logical :: rv
        if (c_associated(a%voidptr, b%voidptr)) then
            rv = .true.
        else
            rv = .false.
        endif
    end function dataview_eq
    
    function dataview_ne(a,b) result (rv)
        use iso_c_binding, only: c_associated
        implicit none
        type(dataview), intent(IN) ::a,b
        logical :: rv
        if (.not. c_associated(a%voidptr, b%voidptr)) then
            rv = .true.
        else
            rv = .false.
        endif
    end function dataview_ne

end module sidre_mod
