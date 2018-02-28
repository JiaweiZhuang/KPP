SUBROUTINE forward(y0, n_time, y_history)
  ! Start from one initial condition and integrate multiple time steps

  USE smog_Model
  USE smog_Initialize, ONLY: Initialize
  USE smog_Global, ONLY: VAR

      REAL(kind=dp) :: T, DVAL(NSPEC)
      REAL(kind=dp) :: RSTATE(20)
      INTEGER :: i
      
      ! Note: f2py doesn't like custom precision and allocable array
      ! Also doesn't like y0(NVAR). Need to write size explicitly
      INTEGER :: n_time
      REAL(kind=8) :: y0(12), y_history(12, n_time)

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
        CALL INTEGRATE( TIN = T, TOUT = T+DT, RSTATUS_U = RSTATE, &
        ICNTRL_U = (/ 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 /) )
        T = RSTATE(1)
        
        y_history(:,i) = VAR

      END DO
!~~~> End Time loop

END SUBROUTINE

! ===================================================
! ===================================================

SUBROUTINE onestep(y0_list, n_sample, y1_list)
  ! Start from many initial conditions and integrate a single time step
  USE smog_Model
  USE smog_Initialize, ONLY: Initialize
  USE smog_Global, ONLY: VAR

      REAL(kind=dp) :: T, DVAL(NSPEC)
      REAL(kind=dp) :: RSTATE(20)
      INTEGER :: i
      
      INTEGER :: n_sample
      REAL(kind=8) :: y0_list(12, n_sample), y1_list(12, n_sample)

      !f2py intent(in) :: y0_list, n_sample
      !f2py intent(out) :: y1_list
      !f2py intent(hide),depend(y0_list) :: n_sample=shape(y1_list,0)
      !f2py depend(n_sample) y1_list

!~~~> Standard KPP Initialization

      STEPMIN = 0.0d0
      STEPMAX = 0.0d0

      DO i=1,NVAR
        RTOL(i) = 1.0d-4
        ATOL(i) = 1.0d-3
      END DO

      CALL Initialize()
      
      ! Time variables are fixed in this case
      T = TSTART
      TIME = T
      
!~~~> Loop over different initial conditions
      DO i = 1, n_sample
        
        VAR = y0_list(:,i)
        
        CALL INTEGRATE( TIN = T, TOUT = T+DT, RSTATUS_U = RSTATE, &
        ICNTRL_U = (/ 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 /) )
        
        y1_list(:,i) = VAR

      END DO
!~~~> End Time loop

END SUBROUTINE
