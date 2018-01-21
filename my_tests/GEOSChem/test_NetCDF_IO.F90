program test_NetCDF_IO

use netcdf
implicit none

character (len = *), parameter :: INPUT_FILE_NAME = "./KPP_fields.nc"
character (len = *), parameter :: OUTPUT_FILE_NAME = "./C_after.nc"
integer :: ncid, varid ! can reuse them for different variables
integer :: x_dimid, y_dimid, z_dimid, n_dimid, dimids(4) ! for NetCDF write

integer, parameter :: IIPAR=72, JJPAR=46, LLPAR=72
integer, parameter :: NSPEC=238, NREACT=722
REAL*8 :: ALL_C_before(NSPEC, IIPAR, JJPAR, LLPAR)
REAL*8 :: ALL_C_after(NSPEC, IIPAR, JJPAR, LLPAR)
REAL*8 :: ALL_RCONST(NREACT, IIPAR, JJPAR, LLPAR)

! =========================
! ---- Read input data ----
! =========================

! Open the file with read-only access
call check( nf90_open(INPUT_FILE_NAME, NF90_NOWRITE, ncid) )

! Read the data
call check( nf90_inq_varid(ncid, "C_before", varid) )
call check( nf90_get_var(ncid, varid, ALL_C_before) )

call check( nf90_inq_varid(ncid, "RCONST", varid) )
call check( nf90_get_var(ncid, varid, ALL_RCONST) )

! Close the file, freeing all resources.
call check( nf90_close(ncid) )

! ========================= 
! ----       Solve     ----
! =========================

! TODO: replace this with true solver
ALL_C_after = ALL_C_before

! ========================= 
! ----  Write results  ----
! =========================

WRITE (6,*) 'Write results'

call check( nf90_create(OUTPUT_FILE_NAME, NF90_CLOBBER, ncid) )

call check( nf90_def_dim(ncid, "lon", IIPAR, x_dimid) )
call check( nf90_def_dim(ncid, "lat", JJPAR, y_dimid) )
call check( nf90_def_dim(ncid, "lev", LLPAR, z_dimid) )
call check( nf90_def_dim(ncid, "nspec", NSPEC, n_dimid) )

dimids =  (/n_dimid, x_dimid, y_dimid, z_dimid/) 
call check( nf90_def_var(ncid, "C_after", NF90_DOUBLE, dimids, varid) )
call check( nf90_enddef(ncid) )
call check( nf90_put_var(ncid, varid, ALL_C_after) )

call check( nf90_close(ncid) )

contains

  subroutine check(status)
    integer, intent ( in) :: status
    
    if(status /= nf90_noerr) then 
      print *, trim(nf90_strerror(status))
      stop "Stopped"
    end if
  end subroutine check  
  
end program