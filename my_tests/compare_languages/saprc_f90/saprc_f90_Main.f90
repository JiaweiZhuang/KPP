! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
! 
! Main Program File
! 
! Generated by KPP-2.2.3 symbolic chemistry Kinetics PreProcessor
!       (http://www.cs.vt.edu/~asandu/Software/KPP)
! KPP is distributed under GPL, the general public licence
!       (http://www.gnu.org/copyleft/gpl.html)
! (C) 1995-1997, V. Damian & A. Sandu, CGRER, Univ. Iowa
! (C) 1997-2005, A. Sandu, Michigan Tech, Virginia Tech
!     With important contributions from:
!        M. Damian, Villanova University, USA
!        R. Sander, Max-Planck Institute for Chemistry, Mainz, Germany
! 
! File                 : saprc_f90_Main.f90
! Time                 : Wed Feb 28 15:54:07 2018
! Working directory    : /home/zhuangjw/KPP/my_tests/compare_languages/saprc_f90
! Equation file        : saprc_f90.kpp
! Output root filename : saprc_f90
! 
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
! 
! MAIN - Main program - driver routine
!   Arguments :
! 
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

PROGRAM saprc_f90_Driver

  USE saprc_f90_Model
  USE saprc_f90_Initialize, ONLY: Initialize

      REAL(kind=dp) :: T, DVAL(NSPEC)
      REAL(kind=dp) :: RSTATE(20), RCNTRL(20)
      INTEGER :: i
  
!~~~> Initialization 

      STEPMIN = 100.0d0
      STEPMAX = 0.0d0

      DO i=1,NVAR
        RTOL(i) = 1.0d-4
        ATOL(i) = 1.0d-3
      END DO
      
      !to be safe
      RCNTRL    = 0.0_dp 
      RSTATE    = 0.0_dp
     
      CALL Initialize()
      CALL InitSaveData()

!~~~> Time loop
      T = TSTART
kron: DO WHILE (T < TEND)

        TIME = T
        CALL GetMass( C, DVAL )
        WRITE(6,991) (T-TSTART)/(TEND-TSTART)*100, T,       &
                   ( TRIM(SPC_NAMES(MONITOR(i))),           &
                     C(MONITOR(i))/CFACTOR, i=1,NMONITOR )
        CALL SaveData()
        CALL Update_SUN() 
        CALL Update_RCONST()
        
        ! Use the previously predicted time step
        ! This speed-ups F90 by ~50%, but still 2x slower than F77!
        RCNTRL(3) = RSTATE(3) 

        CALL INTEGRATE( TIN = T, TOUT = T+DT, RSTATUS_U = RSTATE, &
        ICNTRL_U = (/ 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 /), &
        RCNTRL_U = RCNTRL )
        T = RSTATE(1)
        
        ! PRINT*, 'RSTATE(3)=', RSTATE(3)

      END DO kron
!~~~> End Time loop

      CALL GetMass( C, DVAL )
      WRITE(6,991) (T-TSTART)/(TEND-TSTART)*100, T,     &
               ( TRIM(SPC_NAMES(MONITOR(i))),           &
                 C(MONITOR(i))/CFACTOR, i=1,NMONITOR ) 
      TIME = T
      CALL SaveData()
      CALL CloseSaveData()

991   FORMAT(F6.1,'%. T=',E9.3,2X,200(A,'=',E11.4,'; '))

END PROGRAM saprc_f90_Driver

! End of MAIN function
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
