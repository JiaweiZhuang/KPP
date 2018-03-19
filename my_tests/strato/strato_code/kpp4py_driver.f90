SUBROUTINE forward(y0, n_time, y_history)
  ! Start from one initial condition and integrate multiple time steps
  USE strato_Model
  USE strato_Initialize, ONLY: Initialize
  USE strato_Global, ONLY: VAR, SUN

      REAL(kind=dp) :: T, DVAL(NSPEC)
      REAL(kind=dp) :: RSTATE(20)
      INTEGER :: i
      
      ! Note: f2py doesn't like custom precision and allocable array
      ! Also doesn't like y0(NVAR). Need to write size explicitly
      INTEGER :: n_time
      REAL(kind=8) :: y0(34), y_history(35, n_time) ! also record SUN

      !f2py intent(in) :: y0, n_time
      !f2py intent(out) :: y_history
      !f2py depend(n_time) y_history

!~~~> Standard KPP Initialization

      STEPMIN = 0.0d0
      STEPMAX = 0.0d0

      DO i=1,NVAR
        RTOL(i) = 1.0d-3
        ATOL(i) = 1.0d-12
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
        
        y_history(1:34,i) = VAR
        y_history(35,i) = SUN

      END DO
!~~~> End Time loop

END SUBROUTINE

! ===================================================
! ===================================================

SUBROUTINE onestep(y0_list, n_sample, y1_list)
  ! Start from many initial conditions and integrate a single time step
  USE strato_Model
  USE strato_Initialize, ONLY: Initialize
  USE strato_Global, ONLY: VAR, SUN

      REAL(kind=dp) :: T, DVAL(NSPEC)
      REAL(kind=dp) :: RSTATE(20)
      INTEGER :: i
      
      INTEGER :: n_sample
      ! The last element in y0 is SUN
      REAL(kind=8) :: y0_list(35, n_sample), y1_list(34, n_sample)

      !f2py intent(in) :: y0_list, n_sample
      !f2py intent(out) :: y1_list
      !f2py intent(hide),depend(y0_list) :: n_sample=shape(y1_list,0)
      !f2py depend(n_sample) y1_list

!~~~> Standard KPP Initialization

      STEPMIN = 0.0d0
      STEPMAX = 0.0d0

      DO i=1,NVAR
        RTOL(i) = 1.0d-3
        ATOL(i) = 1.0d-12 ! prevent negative concentration
      END DO

      CALL Initialize()
      
      ! Time variables are fixed in this case
      T = TSTART
      TIME = T
      
!~~~> Loop over different initial conditions
      DO i = 1, n_sample
        
        VAR = y0_list(1:34,i)
        SUN = y0_list(35,i)
        CALL Update_RCONST()
        CALL INTEGRATE( TIN = T, TOUT = T+DT, RSTATUS_U = RSTATE, &
        ICNTRL_U = (/ 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 /) )
        
        y1_list(:,i) = VAR

      END DO
!~~~> End Time loop

END SUBROUTINE
