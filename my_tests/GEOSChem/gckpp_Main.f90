PROGRAM gckpp_Driver

use GCKPP_Model
USE GCKPP_Initialize, ONLY: Initialize
USE gckpp_Precision, ONLY: sp, dp

IMPLICIT NONE

REAL(dp) :: TIN, TOUT ! DT is already defined in gckpp_Global
INTEGER  :: ICNTRL(20), ISTATUS(20), IERR
REAL(dp) :: RCNTRL(20), RSTATE(20)
     
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

CALL Initialize() ! don't seem to do anything

! TODO: use real data
C = 1.0
RCONST = 1.0

print*, 'C: ', C(1: 10)
print*, 'RCONST: ', RCONST(1: 10)
print*, 'RCNTRL: ', RCNTRL 

! Call the KPP integrator
CALL Integrate( TIN,    TOUT,    ICNTRL,      &
                RCNTRL, ISTATUS, RSTATE, IERR )

print*, 'after:'
print*, 'C: ', C(1: 10)
print*, 'RCONST: ', RCONST(1: 10)
print*, 'RSTATE: ', RSTATE
print*, 'IERR: ', IERR


END PROGRAM gckpp_Driver
