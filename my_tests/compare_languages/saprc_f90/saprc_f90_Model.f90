MODULE saprc_f90_Model

!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!  Completely defines the model saprc_f90
!    by using all the associated modules
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  USE saprc_f90_Precision
  USE saprc_f90_Parameters
  USE saprc_f90_Global
  USE saprc_f90_Function
  USE saprc_f90_Integrator
  USE saprc_f90_Rates
  USE saprc_f90_Jacobian
  USE saprc_f90_Hessian
  USE saprc_f90_Stoichiom
  USE saprc_f90_LinearAlgebra
  USE saprc_f90_Monitor
  USE saprc_f90_Util

END MODULE saprc_f90_Model

