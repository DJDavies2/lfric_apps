!----------------------------------------------------------------------------
! (c) Crown copyright 2022 Met Office. All rights reserved.
! The file LICENCE, distributed with this code, contains details of the terms
! under which the code may be used.
!----------------------------------------------------------------------------
!> @brief Calculates a spectrally varying emissivity for a given set of bands.
!>        A Planck weighting is applied. Excluded bands are taken care of.
!>        In addition, a grey emissivity across the longwave is calculated.
!>        Data for the spectrally varying emissivities are available
!>        currently for sea and desert tiles from the Feldman paper:
!>        Daniel R. Feldman, William D. Collins, Robert Pincus, Xianglei Huang,
!>        and Xiuhong Chen, Far-infrared surface emissivity and climate,
!>        PNAS November 18, 2014 111 (46) 16297-16302;
!>        https://doi.org/10.1073/pnas.1413640111.
!>        and alternatively for sea using the IREMIS model
!>        Roger Saunders, James Hocking, Emma Turner, Peter Rayer, David Rundle,
!>        Pascal Brunel, Jerome Vidot, Pascale Roquet, Marco Matricardi,
!>        Alan Geer, Niels Bormann, and Cristina Lupu,
!>        An update on the RTTOV fast radiative transfer model
!>        (currently at version 12), Geosci. Model Dev., 11, 2717-2737, 2018;
!>        https://doi.org/10.5194/gmd-11-2717-2018.
!>        The emissivity data from the paper and the model are contained in
!>        lookup tables in this routine. The data from the paper were
!>        obtained by scanning in the relevant figures in the paper.

module specemis_mod

  implicit none

  contains

! @param[in]  surf_type          String to identify the surface emissivity spectrum (lookup table)
! @param[in[  n_bands            Number of spectral bands
! @param[in]  wavelen_low        Low wavelength limits of the spectral bands (units: metre)
! @param[in]  wavelen_high       High wavelength limits of the spectral bands (units: metre)
! @param[in[  tile_temp          Tile temperature (required in Planck weighting, units: Kelvin)
! @param[in]  n_band_exclude     Number of excluded bands for the spectral bands
! @param[in]  index_band_exclude Indices of the excluded bands for the spectral bands
! @param[out] emis               Emissivities for each of the spectral bands (dimensionless)
! @param[out] grey_emis          Grey emissivity for the longwave region (dimensionless)
  subroutine specemis(surf_type, n_bands, wavelen_low, wavelen_high, &
             tile_temp, n_band_exclude, index_band_exclude, emis,grey_emis)

  use constants_mod, only : r_def, i_def

  use planck_mod, only : planck

  implicit none

  ! String to identify the surface emissivity spectrum (lookup table)
  character(len=*), intent(in) :: surf_type
  ! Number of spectral bands
  integer(i_def), intent(in) :: n_bands
  ! Low wavelength limits of the spectral bands (units: metre)
  real(r_def), intent(in) :: wavelen_low(n_bands)
  ! High wavelength limits of the spectral bands (units: metre)
  real(r_def), intent(in) :: wavelen_high(n_bands)
  ! Tile temperature (required in Planck weighting, units: Kelvin)
  real(r_def), intent(in) :: tile_temp
  ! Number of excluded bands for the spectral bands
  integer(i_def), intent(in) :: n_band_exclude(n_bands)
  ! Indices of the excluded bands for the spectral bands
  integer(i_def), intent(in) :: index_band_exclude(:,:)
  ! Emissivities for each of the spectral bands (dimensionless)
  real(r_def), intent(out) :: emis(n_bands)
  ! Grey emissivity for the longwave region (dimensionless)
  real(r_def), intent(out) :: grey_emis

  ! Size of lookup table (0-3000 wavenumbers at 10 wavenumber spacing)
  ! Units of wavenumbers are inverse cm
  integer(i_def), parameter :: n_val=301
  ! Planck function at lookup table wavelenghts
  real(r_def) :: planck_wavelentbl(n_val)

  ! Planck weighted contribution of each lookup table position to each band
  real(r_def) :: weight(n_val,n_bands)
  ! Total weight for each band
  real(r_def) :: total_weight(n_bands)
  ! Planck weighted contribution to the grey emissivity from each lookup table position
  real(r_def) :: grey_weight(n_val)
  ! Total weight for grey emissivity
  real(r_def) :: grey_total_weight

  ! Local variables for indexing
  integer(i_def) :: i
  integer(i_def) :: j
  integer(i_def) :: k



end subroutine specemis

end module specemis_mod
