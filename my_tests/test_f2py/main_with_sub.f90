SUBROUTINE kpp(y0)

  USE ros_Model
  USE ros_Initialize, ONLY: Initialize
  USE ros_Global, ONLY: VAR,  NVAR

      REAL(kind=dp) :: T, DVAL(NSPEC)
      REAL(kind=dp) :: RSTATE(20)
      INTEGER :: i
      REAL(kind=8) :: y0(5) ! f2py doesn't like custom precision

      !f2py intent(in) :: y0

!~~~> Initialization

      STEPMIN = 0.0d0
      STEPMAX = 0.0d0

      DO i=1,NVAR
        RTOL(i) = 1.0d-4
        ATOL(i) = 1.0d-3
      END DO

      CALL Initialize()

      VAR = y0 ! use initial condition from Python

      print*, NVAR
      print*, y0
      print*, VAR

!~~~> Time loop
      T = TSTART

      WRITE(6,991) (T-TSTART)/(TEND-TSTART)*100, T,     &
               ( TRIM(SPC_NAMES(MONITOR(i))),           &
                 C(MONITOR(i))/CFACTOR, i=1,NMONITOR )

kron: DO WHILE (T < TEND)

        TIME = T
        CALL GetMass( C, DVAL )

        CALL Update_SUN()
        CALL Update_RCONST()

        CALL INTEGRATE( TIN = T, TOUT = T+DT, RSTATUS_U = RSTATE, &
        ICNTRL_U = (/ 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 /) )
        T = RSTATE(1)

      END DO kron
!~~~> End Time loop

      CALL GetMass( C, DVAL )
      WRITE(6,991) (T-TSTART)/(TEND-TSTART)*100, T,     &
               ( TRIM(SPC_NAMES(MONITOR(i))),           &
                 C(MONITOR(i))/CFACTOR, i=1,NMONITOR )
      TIME = T

991   FORMAT(F6.1,'%. T=',E9.3,2X,200(A,'=',E11.4,'; '))

END SUBROUTINE

PROGRAM call_sub
    IMPLICIT NONE

    !CALL kpp()

END PROGRAM
