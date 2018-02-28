SUBROUTINE kpp(y0, y_history)

  USE smog_Model
  USE smog_Initialize, ONLY: Initialize
  USE smog_Global, ONLY: VAR

      REAL(kind=dp) :: T, DVAL(NSPEC)
      REAL(kind=dp) :: RSTATE(20)
      INTEGER :: i
      
      ! Note: f2py doesn't like custom precision and dynamic array
      REAL(kind=8) :: y0(12), y_history(12)

      !f2py intent(in) :: y0
      !f2py intent(out) :: y_history

!~~~> Standard KPP Initialization

      STEPMIN = 0.0d0
      STEPMAX = 0.0d0

      DO i=1,NVAR
        RTOL(i) = 1.0d-4
        ATOL(i) = 1.0d-3
      END DO

      CALL Initialize()

! === f2py initialization ===
      VAR = y0 ! use initial condition from Python
      

!~~~> Time loop
      T = TSTART

kron: DO WHILE (T < TEND)

        TIME = T
        CALL INTEGRATE( TIN = T, TOUT = T+DT, RSTATUS_U = RSTATE, &
        ICNTRL_U = (/ 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 /) )
        T = RSTATE(1)

      END DO kron
!~~~> End Time loop

      y_history = VAR ! TODO: record whole time series

END SUBROUTINE
