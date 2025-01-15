!-----------------------------------------------------------------------------
! (C) Crown copyright 2019 Met Office. All rights reserved.
! The file LICENCE, distributed with this code, contains details of the terms
! under which the code may be used.
!-----------------------------------------------------------------------------
!> @brief Container for Gung Ho model run working data set.
!>
module gungho_model_data_mod

  use field_mod,            only : field_type
  use field_collection_mod, only : field_collection_type

  implicit none

  private

  !> Holds the working data set for a model run and other working state.
  !>
  type, public :: model_data_type

    private

    !> @name Fields needed to time-step the model.
    !> @{
    !> @}

    !> Fields used to store data read in from ancillary files
    type( field_collection_type ), public   :: ancil_fields

    contains

  end type model_data_type

end module gungho_model_data_mod
