! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
! 
! The ODE Function of Chemical Model File
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
! File                 : smog_Function.f90
! Time                 : Tue Feb 27 19:29:48 2018
! Working directory    : /home/zhuangjw/KPP/my_tests/smog/smog_code
! Equation file        : smog.kpp
! Output root filename : smog
! 
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



MODULE smog_Function

  USE smog_Parameters
  IMPLICIT NONE

! A - Rate for each equation
  REAL(kind=dp) :: A(NREACT)

CONTAINS


! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
! 
! Fun - time derivatives of variables - Agregate form
!   Arguments :
!      V         - Concentrations of variable species (local)
!      F         - Concentrations of fixed species (local)
!      RCT       - Rate constants (local)
!      Vdot      - Time derivative of variable species concentrations
! 
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SUBROUTINE Fun ( V, F, RCT, Vdot )

! V - Concentrations of variable species (local)
  REAL(kind=dp) :: V(NVAR)
! F - Concentrations of fixed species (local)
  REAL(kind=dp) :: F(NFIX)
! RCT - Rate constants (local)
  REAL(kind=dp) :: RCT(NREACT)
! Vdot - Time derivative of variable species concentrations
  REAL(kind=dp) :: Vdot(NVAR)


! Computation of equation rates
  A(1) = RCT(1)*V(11)
  A(2) = 2.183e-05*V(2)*F(2)
  A(3) = 26.59*V(5)*V(10)
  A(4) = 3775*V(3)*V(12)
  A(5) = 23410*V(8)*V(12)
  A(6) = RCT(6)*V(8)
  A(7) = 12140*V(6)*V(10)
  A(8) = 11270*V(9)*V(10)
  A(9) = 11270*V(7)*V(10)
  A(10) = 16130*V(11)*V(12)
  A(11) = 6893*V(7)*V(11)
  A(12) = 0.02143*V(4)

! Aggregate function
  Vdot(1) = A(10)
  Vdot(2) = A(1)-A(2)
  Vdot(3) = -A(4)
  Vdot(4) = A(11)-A(12)
  Vdot(5) = A(2)-A(3)
  Vdot(6) = A(6)-A(7)+A(8)
  Vdot(7) = A(5)-A(9)-A(11)+A(12)
  Vdot(8) = -A(5)-A(6)+A(8)
  Vdot(9) = A(4)+A(6)-A(8)+A(9)
  Vdot(10) = A(1)-A(3)-A(7)-A(8)-A(9)
  Vdot(11) = -A(1)+A(3)+A(7)+A(8)+A(9)-A(10)-A(11)+A(12)
  Vdot(12) = -A(4)-A(5)+A(7)-A(10)
      
END SUBROUTINE Fun

! End of Fun function
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



END MODULE smog_Function

