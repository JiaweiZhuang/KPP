SUBROUTINE forward(y0, n_time, y_history)
  ! Start from one initial condition and integrate multiple time steps

  USE small_strato_Model
  USE small_strato_Initialize, ONLY: Initialize
  USE small_strato_Global, ONLY: VAR, SUN

      REAL(kind=dp) :: T, DVAL(NSPEC)
      REAL(kind=dp) :: RSTATE(20)
      INTEGER :: i
      
      ! Note: f2py doesn't like custom precision and allocable array
      ! Also doesn't like y0(NVAR). Need to write size explicitly
      INTEGER :: n_time
      REAL(kind=8) :: y0(5), y_history(6, n_time) ! also record SUN

      !f2py intent(in) :: y0, n_time
      !f2py intent(out) :: y_history
      !f2py depend(n_time) y_history

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

      DO i = 1, n_time

        TIME = T
        
        CALL Update_SUN() 
        CALL Update_RCONST()
        
        CALL INTEGRATE( TIN = T, TOUT = T+DT, RSTATUS_U = RSTATE, &
        ICNTRL_U = (/ 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 /) )
        T = RSTATE(1)
        
        y_history(1:5,i) = VAR
        y_history(6,i) = SUN

      END DO
!~~~> End Time loop

END SUBROUTINE