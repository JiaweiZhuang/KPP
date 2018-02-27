! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
! 
! Sparse Hessian Data Structures File
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
! File                 : saprc99_HessianSP.f90
! Time                 : Tue Feb 27 19:32:50 2018
! Working directory    : /home/zhuangjw/KPP/my_tests/saprc99/saprc99_code
! Equation file        : saprc99.kpp
! Output root filename : saprc99
! 
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



MODULE saprc99_HessianSP

  PUBLIC
  SAVE


! Hessian Sparse Data
! 

  INTEGER, PARAMETER, DIMENSION(360) :: IHESS_I_0 = (/ &
       1,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  3, &
       3,  3,  3,  3,  3,  4,  4,  4,  4,  4,  4,  4, &
       4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  5,  6, &
       6,  6,  7,  8,  9, 11, 12, 12, 13, 14, 15, 16, &
      17, 17, 18, 19, 19, 20, 21, 22, 22, 23, 24, 25, &
      25, 26, 26, 27, 27, 28, 28, 28, 29, 29, 29, 29, &
      30, 31, 32, 32, 32, 33, 33, 33, 34, 34, 34, 34, &
      35, 35, 35, 35, 36, 36, 36, 37, 37, 37, 38, 38, &
      38, 38, 38, 38, 38, 39, 39, 39, 39, 40, 40, 40, &
      40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, &
      40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 41, &
      41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 42, &
      42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, &
      43, 43, 43, 43, 43, 43, 43, 43, 43, 43, 43, 43, &
      43, 43, 44, 44, 44, 44, 45, 45, 45, 45, 45, 45, &
      45, 45, 45, 45, 45, 46, 46, 46, 46, 46, 46, 46, &
      46, 46, 46, 46, 46, 47, 47, 47, 47, 48, 48, 48, &
      48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, &
      48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, &
      48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 49, 49, &
      49, 49, 50, 50, 50, 50, 50, 50, 50, 50, 50, 51, &
      51, 51, 51, 52, 52, 52, 52, 52, 52, 53, 53, 53, &
      53, 54, 54, 54, 54, 54, 54, 54, 55, 55, 55, 55, &
      55, 55, 55, 55, 55, 55, 55, 55, 55, 55, 55, 55, &
      55, 55, 55, 55, 55, 55, 55, 55, 55, 55, 56, 56, &
      56, 56, 56, 56, 56, 56, 56, 56, 56, 56, 56, 56, &
      56, 56, 56, 56, 56, 56, 56, 56, 56, 56, 56, 56, &
      56, 56, 56, 56, 56, 56, 56, 56, 56, 56, 56, 56, &
      56, 56, 56, 56, 56, 56, 56, 56, 56, 56, 57, 57, &
      57, 57, 57, 57, 57, 58, 58, 58, 58, 58, 58, 58 /)
  INTEGER, PARAMETER, DIMENSION(360) :: IHESS_I_1 = (/ &
      58, 58, 58, 59, 59, 59, 59, 59, 59, 59, 59, 59, &
      59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, &
      59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 60, 60, &
      60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, &
      60, 60, 60, 60, 60, 61, 61, 61, 61, 61, 61, 61, &
      61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, &
      61, 61, 61, 62, 62, 62, 62, 62, 62, 62, 62, 62, &
      62, 62, 62, 62, 62, 62, 62, 62, 62, 63, 63, 63, &
      63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, &
      63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, &
      63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, &
      63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, &
      63, 63, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, &
      64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, &
      64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, &
      64, 64, 64, 65, 65, 65, 65, 65, 65, 65, 65, 65, &
      65, 65, 65, 65, 65, 65, 65, 65, 66, 66, 66, 66, &
      66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, &
      66, 66, 66, 66, 66, 66, 66, 67, 67, 67, 67, 67, &
      67, 67, 67, 67, 67, 67, 67, 67, 68, 68, 68, 68, &
      68, 68, 68, 68, 68, 68, 68, 68, 68, 68, 68, 68, &
      68, 68, 68, 68, 68, 68, 68, 68, 68, 68, 68, 68, &
      68, 68, 68, 68, 68, 68, 68, 68, 68, 68, 68, 68, &
      68, 68, 68, 68, 68, 68, 68, 68, 68, 68, 68, 68, &
      68, 68, 68, 69, 69, 69, 69, 69, 69, 69, 69, 69, &
      69, 69, 69, 69, 69, 69, 69, 69, 70, 70, 70, 70, &
      70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, &
      70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, &
      70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, &
      70, 70, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71 /)
  INTEGER, PARAMETER, DIMENSION(128) :: IHESS_I_2 = (/ &
      71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, &
      71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 72, 72, &
      72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, &
      72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, &
      72, 72, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, &
      73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, &
      74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, &
      74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, &
      74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, &
      74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, &
      74, 74, 74, 74, 74, 74, 74, 74 /)
  INTEGER, PARAMETER, DIMENSION(848) :: IHESS_I = (/&
    IHESS_I_0, IHESS_I_1, IHESS_I_2 /)

  INTEGER, PARAMETER, DIMENSION(360) :: IHESS_J_0 = (/ &
       9, 20, 27, 44, 47, 49, 50, 51, 52, 53, 54, 51, &
      53, 63, 64, 66, 68, 47, 49, 51, 52, 53, 63, 63, &
      63, 64, 64, 64, 65, 65, 66, 66, 67, 68, 63, 63, &
      63, 63, 28, 28,  9, 11, 24, 49, 70, 70, 67, 65, &
      17, 63, 70, 19, 69, 20, 21, 21, 22, 23, 24, 25, &
      63, 26, 63, 27, 56, 28, 28, 36, 29, 64, 66, 66, &
      30, 31, 24, 31, 32, 24, 31, 33, 24, 31, 34, 34, &
      24, 31, 35, 35, 28, 36, 46, 37, 63, 63, 24, 31, &
      38, 38, 53, 53, 53, 31, 39, 39, 46, 20, 30, 35, &
      35, 40, 41, 41, 44, 44, 45, 45, 47, 49, 50, 50, &
      50, 51, 52, 52, 52, 53, 53, 54, 56, 56, 59, 24, &
      31, 34, 41, 41, 50, 50, 52, 52, 52, 54, 54, 20, &
      21, 23, 30, 42, 49, 51, 51, 51, 53, 53, 53, 57, &
      34, 36, 38, 39, 41, 43, 45, 50, 52, 55, 56, 59, &
      63, 70, 44, 44, 44, 44, 20, 24, 31, 35, 39, 44, &
      45, 45, 49, 52, 52, 34, 34, 39, 39, 46, 46, 65, &
      67, 67, 67, 67, 67, 47, 47, 47, 47, 21, 23, 30, &
      32, 33, 42, 47, 47, 47, 47, 48, 48, 48, 48, 48, &
      48, 48, 48, 48, 48, 49, 49, 49, 51, 51, 53, 53, &
      53, 54, 57, 60, 65, 67, 67, 67, 67, 67, 49, 49, &
      49, 49, 47, 47, 50, 50, 50, 50, 53, 53, 53, 51, &
      51, 51, 51, 47, 47, 52, 52, 52, 53, 53, 53, 53, &
      53, 47, 47, 53, 53, 54, 54, 54, 11, 21, 23, 30, &
      44, 44, 51, 51, 51, 52, 52, 53, 53, 53, 55, 55, &
      57, 59, 60, 61, 65, 67, 69, 71, 72, 73, 20, 21, &
      23, 26, 29, 30, 42, 44, 44, 44, 47, 47, 47, 49, &
      49, 50, 50, 51, 51, 52, 52, 52, 53, 53, 53, 54, &
      54, 56, 56, 56, 57, 60, 61, 64, 65, 65, 65, 65, &
      65, 65, 65, 66, 66, 66, 66, 66, 66, 66, 22, 49, &
      51, 52, 53, 57, 64, 44, 47, 49, 50, 51, 53, 54 /)
  INTEGER, PARAMETER, DIMENSION(360) :: IHESS_J_1 = (/ &
      58, 58, 58, 20, 21, 23, 30, 32, 33, 35, 37, 44, &
      49, 49, 49, 49, 50, 51, 51, 51, 51, 52, 52, 53, &
      53, 53, 53, 54, 54, 57, 59, 59, 60, 61, 21, 23, &
      30, 50, 51, 52, 52, 53, 53, 53, 53, 54, 57, 60, &
      61, 64, 64, 64, 64, 23, 30, 31, 47, 47, 49, 49, &
      49, 51, 51, 51, 52, 53, 53, 57, 61, 64, 64, 64, &
      64, 64, 64, 35, 44, 47, 49, 50, 51, 52, 53, 54, &
      58, 62, 62, 62, 62, 63, 63, 63, 63,  9, 17, 20, &
      24, 27, 28, 29, 31, 35, 40, 44, 44, 45, 45, 46, &
      49, 50, 51, 52, 53, 53, 54, 56, 56, 56, 57, 61, &
      62, 62, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, &
      63, 63, 64, 64, 64, 64, 66, 66, 66, 66, 68, 68, &
      68, 71, 20, 21, 23, 24, 30, 31, 47, 47, 47, 47, &
      49, 49, 49, 51, 51, 51, 52, 52, 53, 53, 53, 53, &
      54, 57, 59, 60, 61, 63, 64, 64, 64, 64, 64, 64, &
      64, 64, 64, 47, 47, 50, 50, 52, 52, 63, 64, 65, &
      65, 65, 65, 65, 65, 65, 65, 65, 26, 30, 44, 47, &
      51, 53, 53, 63, 64, 65, 65, 66, 66, 66, 66, 66, &
      66, 66, 67, 69, 71, 72, 72, 38, 38, 63, 64, 65, &
      66, 67, 67, 67, 67, 67, 67, 67, 11, 20, 21, 23, &
      24, 30, 31, 34, 35, 37, 39, 44, 44, 44, 47, 47, &
      47, 49, 49, 49, 50, 50, 50, 51, 51, 51, 52, 52, &
      52, 53, 53, 53, 53, 54, 54, 57, 59, 60, 61, 63, &
      64, 65, 65, 66, 67, 67, 68, 68, 68, 68, 68, 69, &
      71, 72, 73, 27, 48, 58, 58, 62, 63, 64, 65, 66, &
      67, 68, 69, 69, 69, 69, 69, 70, 19, 22, 25, 27, &
      28, 46, 47, 48, 48, 49, 53, 57, 58, 58, 62, 62, &
      63, 63, 63, 64, 65, 65, 65, 66, 66, 67, 67, 67, &
      68, 68, 69, 69, 69, 69, 70, 70, 70, 70, 71, 71, &
      71, 71, 34, 36, 38, 39, 41, 43, 44, 45, 47, 48 /)
  INTEGER, PARAMETER, DIMENSION(128) :: IHESS_J_2 = (/ &
      49, 50, 51, 52, 53, 55, 56, 58, 59, 62, 63, 64, &
      65, 66, 67, 68, 69, 70, 71, 71, 71, 71, 30, 32, &
      33, 41, 41, 42, 49, 53, 54, 55, 55, 60, 61, 63, &
      64, 65, 65, 65, 65, 65, 66, 67, 68, 69, 70, 71, &
      72, 72, 45, 45, 49, 50, 52, 53, 54, 59, 59, 60, &
      61, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, &
       9, 11, 17, 19, 20, 21, 23, 24, 25, 26, 29, 30, &
      31, 32, 33, 34, 35, 35, 37, 38, 39, 40, 41, 42, &
      43, 44, 44, 45, 47, 47, 49, 49, 50, 50, 51, 51, &
      52, 52, 53, 53, 54, 54, 55, 56, 57, 59, 60, 61, &
      62, 62, 63, 63, 63, 69, 70, 71 /)
  INTEGER, PARAMETER, DIMENSION(848) :: IHESS_J = (/&
    IHESS_J_0, IHESS_J_1, IHESS_J_2 /)

  INTEGER, PARAMETER, DIMENSION(360) :: IHESS_K_0 = (/ &
      74, 74, 69, 62, 62, 62, 62, 62, 62, 62, 62, 62, &
      62, 72, 72, 72, 72, 62, 62, 62, 62, 62, 65, 67, &
      73, 65, 67, 73, 66, 68, 67, 73, 68, 73, 72, 65, &
      67, 73, 70, 70, 74, 74, 74, 62, 72, 73, 70, 70, &
      74, 63, 71, 74, 74, 74, 74, 74, 70, 74, 74, 74, &
      70, 74, 66, 69, 63, 63, 70, 71, 74, 66, 66, 68, &
      74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 71, 74, &
      74, 74, 62, 74, 63, 71, 70, 74, 64, 68, 74, 74, &
      71, 74, 62, 71, 74, 74, 71, 74, 63, 74, 74, 62, &
      74, 74, 71, 74, 58, 62, 71, 74, 62, 62, 62, 71, &
      74, 62, 62, 71, 74, 58, 62, 62, 71, 74, 74, 74, &
      74, 74, 71, 74, 62, 74, 62, 71, 74, 62, 74, 74, &
      74, 74, 74, 74, 62, 62, 71, 74, 62, 71, 74, 74, &
      71, 71, 71, 71, 71, 74, 71, 71, 71, 71, 71, 71, &
      71, 74, 58, 62, 71, 74, 74, 74, 74, 62, 74, 58, &
      71, 74, 62, 62, 74, 71, 74, 71, 74, 63, 70, 67, &
      67, 69, 71, 72, 73, 58, 62, 71, 74, 74, 74, 74, &
      74, 74, 74, 58, 62, 71, 74, 63, 64, 65, 66, 67, &
      68, 69, 71, 72, 73, 62, 71, 74, 71, 74, 62, 71, &
      74, 74, 74, 74, 67, 67, 69, 71, 72, 73, 58, 62, &
      71, 74, 62, 74, 58, 62, 71, 74, 58, 62, 74, 58, &
      62, 71, 74, 71, 74, 62, 71, 74, 74, 58, 62, 71, &
      74, 62, 74, 62, 71, 58, 62, 74, 74, 74, 74, 74, &
      58, 74, 62, 71, 74, 62, 74, 62, 71, 74, 71, 74, &
      74, 74, 74, 74, 73, 73, 73, 73, 73, 73, 74, 74, &
      74, 74, 74, 74, 74, 58, 62, 74, 58, 62, 74, 62, &
      74, 62, 74, 62, 74, 62, 71, 74, 62, 71, 74, 62, &
      74, 63, 71, 74, 74, 74, 74, 66, 65, 66, 67, 69, &
      71, 72, 73, 66, 67, 68, 69, 71, 72, 73, 70, 71, &
      71, 71, 71, 74, 69, 58, 58, 58, 58, 58, 58, 58 /)
  INTEGER, PARAMETER, DIMENSION(360) :: IHESS_K_1 = (/ &
      62, 69, 70, 74, 74, 74, 74, 74, 74, 74, 74, 71, &
      58, 62, 71, 74, 58, 58, 62, 71, 74, 71, 74, 58, &
      62, 71, 74, 58, 74, 74, 71, 74, 74, 74, 74, 74, &
      74, 74, 58, 62, 74, 58, 62, 71, 74, 58, 74, 74, &
      74, 64, 66, 68, 71, 74, 74, 74, 58, 62, 58, 62, &
      74, 58, 62, 74, 74, 58, 62, 74, 74, 64, 66, 67, &
      68, 72, 73, 62, 62, 62, 62, 62, 62, 62, 62, 62, &
      62, 63, 69, 70, 74, 65, 67, 72, 73, 74, 74, 74, &
      74, 69, 63, 74, 74, 62, 74, 58, 62, 71, 74, 63, &
      62, 62, 62, 62, 58, 62, 62, 63, 71, 74, 74, 74, &
      63, 74, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, &
      73, 74, 64, 66, 68, 71, 66, 68, 69, 71, 68, 69, &
      71, 74, 74, 74, 74, 74, 74, 74, 58, 62, 71, 74, &
      62, 71, 74, 62, 71, 74, 71, 74, 58, 62, 71, 74, &
      74, 74, 74, 74, 74, 64, 64, 65, 66, 67, 68, 69, &
      71, 72, 73, 58, 62, 71, 74, 71, 74, 65, 65, 65, &
      66, 67, 68, 69, 70, 71, 72, 73, 74, 74, 58, 58, &
      62, 62, 71, 66, 66, 66, 72, 66, 67, 68, 69, 71, &
      72, 73, 72, 72, 72, 72, 73, 71, 74, 67, 67, 67, &
      67, 67, 68, 69, 70, 71, 72, 73, 74, 74, 74, 74, &
      74, 74, 74, 74, 74, 74, 74, 58, 71, 74, 62, 71, &
      74, 62, 71, 74, 62, 71, 74, 62, 71, 74, 62, 71, &
      74, 58, 62, 71, 74, 62, 74, 74, 74, 74, 74, 68, &
      68, 68, 73, 68, 68, 73, 68, 69, 71, 72, 73, 73, &
      73, 73, 73, 69, 69, 69, 70, 69, 69, 69, 69, 69, &
      69, 69, 69, 71, 72, 73, 74, 71, 74, 70, 74, 69, &
      70, 70, 71, 69, 71, 71, 71, 74, 69, 70, 69, 70, &
      69, 70, 71, 71, 69, 70, 71, 69, 71, 69, 70, 71, &
      69, 71, 69, 71, 72, 73, 71, 72, 73, 74, 71, 72, &
      73, 74, 71, 71, 71, 71, 71, 74, 71, 71, 71, 71 /)
  INTEGER, PARAMETER, DIMENSION(128) :: IHESS_K_2 = (/ &
      71, 71, 71, 71, 71, 71, 71, 70, 71, 70, 71, 71, &
      71, 71, 71, 71, 71, 71, 71, 72, 73, 74, 74, 74, &
      74, 71, 74, 74, 62, 62, 74, 71, 74, 74, 74, 72, &
      72, 65, 67, 69, 71, 73, 72, 72, 72, 72, 72, 72, &
      72, 73, 71, 74, 62, 62, 62, 62, 62, 71, 74, 74, &
      74, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, &
      74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, &
      74, 74, 74, 74, 62, 74, 74, 74, 74, 74, 74, 74, &
      74, 62, 74, 74, 62, 74, 62, 74, 62, 74, 62, 74, &
      62, 74, 62, 74, 62, 74, 74, 74, 74, 74, 74, 74, &
      63, 74, 69, 71, 74, 74, 74, 74 /)
  INTEGER, PARAMETER, DIMENSION(848) :: IHESS_K = (/&
    IHESS_K_0, IHESS_K_1, IHESS_K_2 /)


END MODULE saprc99_HessianSP

