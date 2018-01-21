PROGRAM gckpp_Driver

use netcdf
use GCKPP_Model
USE GCKPP_Initialize, ONLY: Initialize
USE gckpp_Precision, ONLY: sp, dp

IMPLICIT NONE

! =========================
! -- Variable declaration -
! =========================

! For KPP solver
REAL(dp) :: TIN, TOUT ! DT is already defined in gckpp_Global
INTEGER  :: ICNTRL(20), ISTATUS(20), IERR
REAL(dp) :: RCNTRL(20), RSTATE(20)

! For IO
character (len = *), parameter :: INPUT_FILE_NAME = "./KPP_fields.nc"
character (len = *), parameter :: OUTPUT_FILE_NAME = "./C_after.nc"
integer :: ncid, varid ! can reuse them for different variables
integer :: x_dimid, y_dimid, z_dimid, n_dimid, dimids(4) ! for NetCDF write

! For data
integer :: II, JJ, LL ! for looping through data
integer, parameter :: IIPAR=72, JJPAR=46, LLPAR=72
! NSPEC=238, NREACT=722 are already defined by KPP
REAL*8 :: ALL_C_before(NSPEC, IIPAR, JJPAR, LLPAR)
REAL*8 :: ALL_C_after(NSPEC, IIPAR, JJPAR, LLPAR)
REAL*8 :: ALL_RCONST(NREACT, IIPAR, JJPAR, LLPAR)

! =========================
! --- KPP configuration ---
! =========================

!%%%%% TIMESTEPS %%%%%
DT        = 20d0 * 60d0 ! in seconds
TIN       = 0d0
TOUT      = TIN + DT
 
!%%%%% CONVERGENCE CRITERIA () %%%%%
! ATOL(NVAR), RTOL(NVAR) are defined in gckpp_Global.F90
ATOL      = 1e-2_dp    
RTOL      = 0.5e-2_dp 

!%%%%% SOLVER OPTIONS %%%%%
! taken from flexchem_mod.F90
ICNTRL    = 0 ! Zero all slots of IC
ICNTRL(1) = 1
ICNTRL(2) = 0
ICNTRL(3) = 4
ICNTRL(7) = 1
RCNTRL    = 0.0_dp ! Zero all slots of RCNTRL
!! RCNTRL(3) = HSAVE_KPP(I,J,L) ! Only do one time step. Don't have this.

! =========================
! ---- Read input data ----
! =========================

WRITE (6,*) 'Read input data'

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
! Pass data to KPP and solve
! =========================

WRITE (6,*) 'Solving ODE'

CALL Initialize() ! don't seem to do anything

DO LL=1,LLPAR
WRITE (6,*) 'Loop through layer', LL
DO JJ=1,JJPAR
DO II=1,IIPAR

C(:) = ALL_C_before(:,II,JJ,LL)
RCONST(:) = ALL_RCONST(:,II,JJ,LL)

! Call the KPP integrator
CALL Integrate( TIN,    TOUT,    ICNTRL,      &
                RCNTRL, ISTATUS, RSTATE, IERR )

! Equivalence statement is still used in standalone KPP,
! Thus can just copy C, not VAR and FIX
ALL_C_after(:,II,JJ,LL) = C(:)

ENDDO ! FOR II
ENDDO ! FOR JJ
ENDDO ! FOR LL

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

! ========================= 
! - NetCDF util function  -
! =========================

contains

  subroutine check(status)
    implicit none
    integer, intent ( in) :: status
    
    if(status /= nf90_noerr) then 
      print *, trim(nf90_strerror(status))
      stop "Stopped"
    end if
  end subroutine check  

END PROGRAM gckpp_Driver
