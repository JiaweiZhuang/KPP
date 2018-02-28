! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
! 
! Sparse Stoichiometric Data Structures File
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
! File                 : saprc_f90_StoichiomSP.f90
! Time                 : Wed Feb 28 15:54:07 2018
! Working directory    : /home/zhuangjw/KPP/my_tests/compare_languages/saprc_f90
! Equation file        : saprc_f90.kpp
! Output root filename : saprc_f90
! 
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



MODULE saprc_f90_StoichiomSP

  USE saprc_f90_Precision
  PUBLIC
  SAVE


! Row-compressed sparse data for the Jacobian of reaction products JVRP

  INTEGER, PARAMETER, DIMENSION(212) :: CROW_JVRP = (/ &
       1,  2,  3,  5,  7,  9, 11, 13, 15, 17, 18, 20, &
      21, 22, 24, 25, 26, 27, 28, 29, 30, 32, 33, 34, &
      36, 38, 40, 42, 43, 45, 47, 49, 51, 52, 53, 55, &
      57, 58, 59, 61, 62, 63, 65, 67, 69, 70, 72, 74, &
      76, 77, 78, 80, 82, 84, 86, 87, 89, 91, 93, 95, &
      97, 98,100,102,104,106,108,110,111,113,114,116, &
     118,120,122,124,126,128,129,131,132,134,136,138, &
     140,142,144,146,148,149,151,152,154,156,158,160, &
     162,164,166,168,170,171,173,174,176,178,180,182, &
     184,186,188,190,192,194,195,197,198,200,202,203, &
     205,207,208,209,210,212,214,215,217,219,221,222, &
     224,226,227,229,231,232,234,235,237,239,240,242, &
     243,244,245,247,249,250,252,254,255,257,259,261, &
     263,265,267,268,270,272,274,276,278,279,281,283, &
     285,286,288,290,292,293,295,296,298,299,301,303, &
     305,306,308,309,310,312,314,316,318,320,322,324, &
     326,328,330,332,334,336,338,340,342,344,346,348, &
     350,352,354,356,358,360,362,364 /)

  INTEGER, PARAMETER, DIMENSION(360) :: ICOL_JVRP_0 = (/ &
      70, 58, 58, 62, 58, 69, 58, 70, 58, 70, 62, 69, &
      62, 70, 69, 71, 69, 70, 71, 18, 18, 70, 71, 71, &
      71, 62, 62, 10, 10, 69, 74, 19, 19, 19, 74, 70, &
      74, 71, 74, 43, 74, 43, 40, 74, 62, 74, 63, 69, &
      63, 70, 25, 25, 25, 74, 62, 63, 63, 63, 63, 71, &
      71, 17, 17, 74, 63, 74,  9, 74, 74, 66, 69, 63, &
      66, 66, 71, 66, 66, 68, 69, 63, 68, 68, 71, 66, &
      68, 68, 48, 69, 48, 63, 48, 71, 48, 66, 48, 68, &
      48, 64, 69, 63, 64, 64, 66, 64, 71, 64, 68, 48, &
      64, 64, 70, 72, 13, 69, 72, 63, 72, 71, 72, 66, &
      72, 68, 72, 48, 72, 64, 72, 72, 70, 73, 14, 69, &
      73, 63, 73, 71, 73, 66, 73, 68, 73, 48, 73, 64, &
      73, 72, 73, 73, 67, 70, 15, 67, 69, 63, 67, 67, &
      71, 66, 67, 67, 68, 48, 67, 64, 67, 67, 72, 67, &
      73, 67, 65, 70, 16, 65, 69, 63, 65, 65, 71, 65, &
      66, 65, 68, 48, 65, 64, 65, 65, 72, 65, 73, 65, &
      67, 65, 22, 70, 22, 46, 70, 46, 63, 46, 28, 70, &
      28, 63, 28, 56, 56, 56, 74, 56, 63, 27, 27, 69, &
      56, 71, 55, 74, 55, 55, 71, 59, 74, 59, 59, 71, &
      42, 74, 42, 60, 74, 60, 29, 74, 26, 74, 26, 37, &
      74, 37, 45, 45, 45, 74, 45, 71, 41, 41, 74, 41, &
      71, 12, 39, 74, 39, 71, 34, 74, 34, 71, 36, 71, &
      38, 74, 38, 38, 71, 50, 74, 50, 62, 50, 71, 50, &
      58, 50, 54, 74, 54, 62, 54, 58, 54, 52, 74, 52, &
      62, 52, 71, 52, 61, 74, 61, 57, 74, 57, 35, 74, &
      35, 62, 32, 74, 32, 33, 74, 33, 74, 44, 74, 44, &
      62, 44, 71, 44, 58, 47, 74, 47, 62, 47, 71, 47, &
      58, 49, 74, 49, 62, 49, 71, 49, 58, 11, 74, 20, &
      74, 21, 74, 30, 74, 23, 74, 31, 74, 24, 74, 51, &
      74, 51, 62, 51, 71, 51, 58, 53, 74, 53, 62, 53 /)
  INTEGER, PARAMETER, DIMENSION(3) :: ICOL_JVRP_1 = (/ &
      71, 53, 58 /)
  INTEGER, PARAMETER, DIMENSION(363) :: ICOL_JVRP = (/&
    ICOL_JVRP_0, ICOL_JVRP_1 /)

  INTEGER, PARAMETER, DIMENSION(360) :: IROW_JVRP_0 = (/ &
       1,  2,  3,  3,  4,  4,  5,  5,  6,  6,  7,  7, &
       8,  8,  9,  9, 10, 11, 11, 12, 13, 14, 14, 15, &
      16, 17, 18, 19, 20, 21, 21, 22, 23, 24, 24, 25, &
      25, 26, 26, 27, 27, 28, 29, 29, 30, 30, 31, 31, &
      32, 32, 33, 34, 35, 35, 36, 36, 37, 38, 39, 39, &
      40, 41, 42, 42, 43, 43, 44, 44, 45, 46, 46, 47, &
      47, 48, 48, 49, 50, 51, 51, 52, 52, 53, 53, 54, &
      54, 55, 56, 56, 57, 57, 58, 58, 59, 59, 60, 60, &
      61, 62, 62, 63, 63, 64, 64, 65, 65, 66, 66, 67, &
      67, 68, 69, 69, 70, 71, 71, 72, 72, 73, 73, 74, &
      74, 75, 75, 76, 76, 77, 77, 78, 79, 79, 80, 81, &
      81, 82, 82, 83, 83, 84, 84, 85, 85, 86, 86, 87, &
      87, 88, 88, 89, 90, 90, 91, 92, 92, 93, 93, 94, &
      94, 95, 95, 96, 96, 97, 97, 98, 98, 99, 99,100, &
     100,101,102,102,103,104,104,105,105,106,106,107, &
     107,108,108,109,109,110,110,111,111,112,112,113, &
     113,114,115,115,116,117,117,118,118,119,120,120, &
     121,121,122,123,124,125,125,126,126,127,128,128, &
     129,129,130,130,131,132,132,133,133,134,135,135, &
     136,136,137,138,138,139,140,140,141,141,142,143, &
     143,144,145,146,147,147,148,148,149,150,150,151, &
     151,152,153,153,154,154,155,155,156,156,157,157, &
     158,158,159,160,160,161,161,162,162,163,163,164, &
     164,165,166,166,167,167,168,168,169,170,170,171, &
     171,172,172,173,174,174,175,176,176,177,178,178, &
     179,179,180,180,181,182,182,183,184,185,185,186, &
     186,187,187,188,188,189,189,190,190,191,191,192, &
     192,193,193,194,194,195,195,196,196,197,197,198, &
     198,199,199,200,200,201,201,202,202,203,203,204, &
     204,205,205,206,206,207,207,208,208,209,209,210 /)
  INTEGER, PARAMETER, DIMENSION(3) :: IROW_JVRP_1 = (/ &
     210,211,211 /)
  INTEGER, PARAMETER, DIMENSION(363) :: IROW_JVRP = (/&
    IROW_JVRP_0, IROW_JVRP_1 /)



!  Stoichiometric Matrix in Compressed Column Sparse Format


  INTEGER, PARAMETER, DIMENSION(212) :: CCOL_STOICM = (/ &
       1,  4,  6,  8, 11, 14, 17, 20, 23, 26, 28, 31, &
      34, 36, 38, 40, 43, 45, 47, 49, 51, 54, 57, 60, &
      63, 66, 70, 73, 76, 79, 82, 86, 89, 92, 97,100, &
     103,105,107,112,114,116,119,121,125,127,132,135, &
     140,143,146,150,153,157,162,164,167,168,171,172, &
     173,173,176,179,186,191,196,197,201,204,207,211, &
     216,220,224,227,228,232,234,237,240,245,250,255, &
     259,262,263,267,272,275,278,281,286,291,296,300, &
     303,304,308,313,319,322,325,328,333,338,343,347, &
     350,351,354,357,363,369,372,375,378,381,384,386, &
     390,393,395,398,400,404,407,410,415,420,423,427, &
     431,438,443,447,452,455,465,469,473,477,481,485, &
     489,492,495,500,506,510,514,519,521,526,530,535, &
     539,543,546,548,552,560,570,576,579,587,596,606, &
     610,615,628,642,653,661,672,681,694,706,711,717, &
     722,730,735,743,745,750,757,761,770,779,793,800, &
     808,816,834,842,846,850,861,872,886,897,911,924, &
     934,950,959,964,977,1000,1015,1025 /)

  INTEGER, PARAMETER, DIMENSION(360) :: IROW_STOICM_0 = (/ &
      58, 69, 70, 58, 62, 58, 62, 58, 69, 70, 58, 69, &
      70, 58, 70, 71, 62, 69, 70, 62, 70, 71, 69, 70, &
      71, 69, 70, 18, 70, 71, 18, 70, 71, 18, 43, 69, &
      71, 69, 71, 58, 70, 71, 58, 62, 10, 62, 10, 74, &
      10, 58, 19, 69, 74, 19, 69, 74, 19, 63, 70, 19, &
      70, 74, 43, 70, 74, 63, 70, 71, 74, 43, 71, 74, &
      43, 70, 74, 40, 63, 74, 62, 63, 74, 63, 69, 70, &
      74, 25, 63, 70, 25, 63, 70, 25, 63, 70, 71, 74, &
      25, 70, 74, 62, 63, 74, 17, 63, 17, 63, 43, 63, &
      70, 71, 74, 70, 71, 17, 74, 17, 63, 74, 63, 74, &
       1,  9, 63, 74, 63, 74, 56, 63, 66, 69, 70, 26, &
      63, 66, 56, 63, 66, 70, 71, 29, 56, 66, 56, 63, &
      66, 63, 68, 69, 70, 37, 63, 68, 63, 68, 70, 71, &
      29, 56, 63, 66, 68, 63, 68, 48, 69, 70, 48, 48, &
      70, 71, 48, 48, 57, 64, 69, 37, 63, 64, 29, 56, &
      60, 61, 63, 64, 66, 60, 63, 64, 70, 71, 60, 61, &
      63, 64, 68, 48, 60, 61, 63, 64, 13, 70, 72, 13, &
      70, 72, 66, 69, 70, 72,  3,  5, 62, 63, 72, 66, &
      70, 71, 72,  3, 56, 66, 72,  3, 68, 72, 48,  3, &
      61, 64, 72, 66, 72, 14, 70, 73, 14, 70, 73, 55, &
      68, 69, 70, 73,  4,  6, 62, 63, 73, 55, 68, 70, &
      71, 73,  4, 56, 66, 73,  4, 68, 73, 48,  4, 61, &
      64, 73, 55, 66, 68, 72, 73, 55, 68, 73, 15, 67, &
      70, 15, 67, 70, 46, 48, 67, 69, 70,  4,  6, 62, &
      63, 67, 46, 48, 67, 70, 71,  4, 56, 66, 67,  4, &
      67, 68, 48,  4, 61, 64, 67, 46, 48, 66, 67, 72, &
      46, 48, 55, 67, 68, 73, 46, 48, 67, 16, 65, 70, &
      16, 65, 70, 56, 65, 69, 70, 72,  4,  6, 62, 63, &
      65, 56, 65, 70, 71, 72,  4, 56, 65, 66,  4, 65, &
      68, 48,  4, 64, 65, 56, 65, 66, 55, 56, 65, 68 /)
  INTEGER, PARAMETER, DIMENSION(360) :: IROW_STOICM_1 = (/ &
      72, 73, 46, 48, 56, 65, 67, 72, 56, 65, 72, 22, &
      57, 70, 22, 42, 66, 36, 46, 70, 39, 46, 63, 39, &
      46,  7,  8, 28, 70, 28, 36, 63, 28, 36, 40, 56, &
      63, 40, 56, 40, 56, 63, 74, 27, 56, 63, 27, 56, &
      63,  2, 27, 63, 69, 70, 40, 43, 56, 63, 71, 55, &
      72, 74, 40, 55, 63, 66, 43, 55, 71, 72, 40, 55, &
      59, 64, 68, 73, 74, 40, 55, 59, 63, 68, 43, 59, &
      71, 73, 42, 48, 56, 72, 74, 42, 66, 72, 48, 55, &
      56, 59, 60, 64, 68, 72, 73, 74, 55, 60, 68, 72, &
      29, 56, 63, 74, 26, 56, 66, 74, 26, 56, 63, 74, &
      37, 59, 68, 74, 37, 59, 63, 74, 40, 45, 63, 40, &
      45, 56, 40, 45, 63, 73, 74, 40, 43, 45, 63, 71, &
      73, 40, 41, 63, 72, 40, 41, 72, 74, 40, 41, 43, &
      71, 72, 12, 72, 39, 45, 46, 68, 74, 39, 43, 46, &
      71, 34, 41, 46, 68, 74, 34, 43, 46, 71, 28, 36, &
      43, 71, 38, 67, 74,  8, 38, 38, 43, 67, 71, 40, &
      41, 50, 56, 60, 65, 68, 74,  2, 40, 41, 50, 56, &
      62, 63, 68, 73, 74, 40, 43, 50, 65, 68, 71, 50, &
      58, 59, 40, 50, 56, 63, 65, 68, 72, 74, 41, 48, &
      54, 56, 59, 64, 68, 72, 74,  2, 40, 41, 54, 56, &
      62, 63, 68, 73, 74, 54, 58, 59, 60, 40, 54, 61, &
      65, 66, 40, 41, 45, 52, 55, 56, 59, 60, 61, 64, &
      65, 68, 74,  2,  4, 40, 41, 45, 52, 55, 56, 60, &
      62, 63, 68, 73, 74, 40, 41, 43, 52, 56, 57, 59, &
      64, 65, 68, 71, 40, 52, 55, 56, 60, 63, 72, 73, &
      55, 56, 59, 60, 61, 63, 64, 68, 72, 73, 74, 48, &
      55, 56, 59, 61, 64, 68, 72, 73, 42, 48, 55, 56, &
      57, 59, 60, 61, 63, 64, 68, 70, 74, 42, 48, 55, &
      56, 57, 59, 60, 61, 63, 64, 68, 70, 35, 40, 59, &
      68, 74, 35, 40, 45, 62, 63, 74, 32, 48, 59, 72 /)
  INTEGER, PARAMETER, DIMENSION(304) :: IROW_STOICM_2 = (/ &
      74, 32, 40, 41, 45, 48, 63, 68, 72, 33, 48, 59, &
      72, 74, 33, 40, 41, 45, 48, 63, 68, 72, 66, 74, &
      44, 55, 56, 68, 74,  2, 40, 44, 56, 62, 63, 74, &
      44, 59, 68, 71, 40, 44, 45, 55, 56, 58, 63, 66, &
      68, 47, 48, 50, 52, 54, 56, 64, 68, 74,  2,  4, &
      40, 47, 48, 50, 54, 56, 61, 62, 64, 65, 68, 74, &
      47, 48, 52, 64, 68, 70, 71, 47, 48, 56, 58, 61, &
      64, 65, 66, 48, 49, 56, 59, 61, 64, 68, 74,  2, &
       4, 12, 40, 42, 45, 48, 49, 56, 59, 61, 62, 63, &
      64, 68, 72, 73, 74, 48, 49, 57, 59, 64, 68, 70, &
      71, 49, 58, 59, 61, 11, 55, 68, 74,  2, 20, 40, &
      42, 45, 56, 59, 63, 64, 68, 74, 21, 22, 42, 48, &
      55, 56, 59, 60, 64, 68, 74, 30, 40, 42, 48, 55, &
      56, 59, 60, 61, 64, 66, 68, 72, 74, 23, 42, 48, &
      55, 56, 59, 60, 61, 64, 68, 74, 31, 32, 33, 34, &
      35, 38, 39, 41, 45, 61, 63, 64, 68, 74, 12, 24, &
      32, 33, 34, 35, 38, 41, 45, 63, 64, 68, 74, 42, &
      48, 51, 55, 56, 59, 61, 64, 68, 74,  2,  3,  4, &
      40, 42, 51, 55, 56, 59, 61, 62, 63, 64, 66, 68, &
      74, 42, 48, 51, 55, 57, 59, 64, 68, 71, 51, 58, &
      59, 60, 61, 38, 42, 48, 50, 52, 53, 55, 56, 59, &
      60, 64, 68, 74,  2,  3,  4, 38, 40, 42, 48, 50, &
      53, 54, 55, 56, 59, 60, 61, 62, 63, 64, 66, 68, &
      72, 73, 74, 38, 42, 48, 53, 54, 55, 56, 57, 59, &
      60, 64, 66, 68, 70, 71, 40, 50, 53, 58, 59, 60, &
      61, 63, 64, 68 /)
  INTEGER, PARAMETER, DIMENSION(1024) :: IROW_STOICM = (/&
    IROW_STOICM_0, IROW_STOICM_1, IROW_STOICM_2 /)

  INTEGER, PARAMETER, DIMENSION(360) :: ICOL_STOICM_0 = (/ &
       1,  1,  1,  2,  2,  3,  3,  4,  4,  4,  5,  5, &
       5,  6,  6,  6,  7,  7,  7,  8,  8,  8,  9,  9, &
       9, 10, 10, 11, 11, 11, 12, 12, 12, 13, 13, 14, &
      14, 15, 15, 16, 16, 16, 17, 17, 18, 18, 19, 19, &
      20, 20, 21, 21, 21, 22, 22, 22, 23, 23, 23, 24, &
      24, 24, 25, 25, 25, 26, 26, 26, 26, 27, 27, 27, &
      28, 28, 28, 29, 29, 29, 30, 30, 30, 31, 31, 31, &
      31, 32, 32, 32, 33, 33, 33, 34, 34, 34, 34, 34, &
      35, 35, 35, 36, 36, 36, 37, 37, 38, 38, 39, 39, &
      39, 39, 39, 40, 40, 41, 41, 42, 42, 42, 43, 43, &
      44, 44, 44, 44, 45, 45, 46, 46, 46, 46, 46, 47, &
      47, 47, 48, 48, 48, 48, 48, 49, 49, 49, 50, 50, &
      50, 51, 51, 51, 51, 52, 52, 52, 53, 53, 53, 53, &
      54, 54, 54, 54, 54, 55, 55, 56, 56, 56, 57, 58, &
      58, 58, 59, 60, 62, 62, 62, 63, 63, 63, 64, 64, &
      64, 64, 64, 64, 64, 65, 65, 65, 65, 65, 66, 66, &
      66, 66, 66, 67, 68, 68, 68, 68, 69, 69, 69, 70, &
      70, 70, 71, 71, 71, 71, 72, 72, 72, 72, 72, 73, &
      73, 73, 73, 74, 74, 74, 74, 75, 75, 75, 76, 77, &
      77, 77, 77, 78, 78, 79, 79, 79, 80, 80, 80, 81, &
      81, 81, 81, 81, 82, 82, 82, 82, 82, 83, 83, 83, &
      83, 83, 84, 84, 84, 84, 85, 85, 85, 86, 87, 87, &
      87, 87, 88, 88, 88, 88, 88, 89, 89, 89, 90, 90, &
      90, 91, 91, 91, 92, 92, 92, 92, 92, 93, 93, 93, &
      93, 93, 94, 94, 94, 94, 94, 95, 95, 95, 95, 96, &
      96, 96, 97, 98, 98, 98, 98, 99, 99, 99, 99, 99, &
     100,100,100,100,100,100,101,101,101,102,102,102, &
     103,103,103,104,104,104,104,104,105,105,105,105, &
     105,106,106,106,106,106,107,107,107,107,108,108, &
     108,109,110,110,110,111,111,111,112,112,112,112 /)
  INTEGER, PARAMETER, DIMENSION(360) :: ICOL_STOICM_1 = (/ &
     112,112,113,113,113,113,113,113,114,114,114,115, &
     115,115,116,116,116,117,117,117,118,118,118,119, &
     119,120,120,120,120,121,121,121,122,122,123,123, &
     123,124,124,125,125,125,125,126,126,126,127,127, &
     127,128,128,128,128,128,129,129,129,129,129,130, &
     130,130,131,131,131,131,132,132,132,132,133,133, &
     133,133,133,133,133,134,134,134,134,134,135,135, &
     135,135,136,136,136,136,136,137,137,137,138,138, &
     138,138,138,138,138,138,138,138,139,139,139,139, &
     140,140,140,140,141,141,141,141,142,142,142,142, &
     143,143,143,143,144,144,144,144,145,145,145,146, &
     146,146,147,147,147,147,147,148,148,148,148,148, &
     148,149,149,149,149,150,150,150,150,151,151,151, &
     151,151,152,152,153,153,153,153,153,154,154,154, &
     154,155,155,155,155,155,156,156,156,156,157,157, &
     157,157,158,158,158,159,159,160,160,160,160,161, &
     161,161,161,161,161,161,161,162,162,162,162,162, &
     162,162,162,162,162,163,163,163,163,163,163,164, &
     164,164,165,165,165,165,165,165,165,165,166,166, &
     166,166,166,166,166,166,166,167,167,167,167,167, &
     167,167,167,167,167,168,168,168,168,169,169,169, &
     169,169,170,170,170,170,170,170,170,170,170,170, &
     170,170,170,171,171,171,171,171,171,171,171,171, &
     171,171,171,171,171,172,172,172,172,172,172,172, &
     172,172,172,172,173,173,173,173,173,173,173,173, &
     174,174,174,174,174,174,174,174,174,174,174,175, &
     175,175,175,175,175,175,175,175,176,176,176,176, &
     176,176,176,176,176,176,176,176,176,177,177,177, &
     177,177,177,177,177,177,177,177,177,178,178,178, &
     178,178,179,179,179,179,179,179,180,180,180,180 /)
  INTEGER, PARAMETER, DIMENSION(304) :: ICOL_STOICM_2 = (/ &
     180,181,181,181,181,181,181,181,181,182,182,182, &
     182,182,183,183,183,183,183,183,183,183,184,184, &
     185,185,185,185,185,186,186,186,186,186,186,186, &
     187,187,187,187,188,188,188,188,188,188,188,188, &
     188,189,189,189,189,189,189,189,189,189,190,190, &
     190,190,190,190,190,190,190,190,190,190,190,190, &
     191,191,191,191,191,191,191,192,192,192,192,192, &
     192,192,192,193,193,193,193,193,193,193,193,194, &
     194,194,194,194,194,194,194,194,194,194,194,194, &
     194,194,194,194,194,195,195,195,195,195,195,195, &
     195,196,196,196,196,197,197,197,197,198,198,198, &
     198,198,198,198,198,198,198,198,199,199,199,199, &
     199,199,199,199,199,199,199,200,200,200,200,200, &
     200,200,200,200,200,200,200,200,200,201,201,201, &
     201,201,201,201,201,201,201,201,202,202,202,202, &
     202,202,202,202,202,202,202,202,202,202,203,203, &
     203,203,203,203,203,203,203,203,203,203,203,204, &
     204,204,204,204,204,204,204,204,204,205,205,205, &
     205,205,205,205,205,205,205,205,205,205,205,205, &
     205,206,206,206,206,206,206,206,206,206,207,207, &
     207,207,207,208,208,208,208,208,208,208,208,208, &
     208,208,208,208,209,209,209,209,209,209,209,209, &
     209,209,209,209,209,209,209,209,209,209,209,209, &
     209,209,209,210,210,210,210,210,210,210,210,210, &
     210,210,210,210,210,210,211,211,211,211,211,211, &
     211,211,211,211 /)
  INTEGER, PARAMETER, DIMENSION(1024) :: ICOL_STOICM = (/&
    ICOL_STOICM_0, ICOL_STOICM_1, ICOL_STOICM_2 /)

  REAL(kind=dp), PARAMETER, DIMENSION(150) :: STOICM_0 = (/ &
       1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp, &
       -1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp, &
       -1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp, &
       1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp, &
       -1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  2.000000e+00_dp,  -1.000000e+00_dp, &
       -2.000000e+00_dp,  2.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp, &
       -1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  2.000000e+00_dp, &
       1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp, &
       1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp, &
       -1.000000e+00_dp,  -1.000000e+00_dp,  2.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp, &
       1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp, &
       1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp, &
       1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp, &
       1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp, &
       1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp, &
       -1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp, &
       -1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp, &
       1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp, &
       1.000000e+00_dp,  -1.000000e+00_dp,  6.100000e-01_dp,  6.100000e-01_dp,  3.900000e-01_dp, &
       3.900000e-01_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp, &
       -1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp,  -2.000000e+00_dp,  1.000000e+00_dp, &
       -2.000000e+00_dp,  2.000000e-01_dp,  -1.000000e+00_dp,  8.000000e-01_dp,  -1.000000e+00_dp, &
       8.000000e-01_dp,  2.000000e+00_dp,  -2.000000e+00_dp,  -1.000000e+00_dp,  2.000000e+00_dp, &
       -1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp, &
       1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp, &
       -1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp, &
       1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp, &
       1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp, &
       1.000000e+00_dp,  -2.000000e+00_dp,  2.000000e+00_dp,  2.000000e+00_dp,  -2.000000e+00_dp, &
       1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp /)
  REAL(kind=dp), PARAMETER, DIMENSION(150) :: STOICM_1 = (/ &
       -1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp, &
       -1.000000e+00_dp,  2.500000e-01_dp,  7.500000e-01_dp,  1.000000e+00_dp,  -1.000000e+00_dp, &
       -1.000000e+00_dp,  1.000000e+00_dp,  -2.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp, &
       1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp, &
       -1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp, &
       1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp,  2.500000e-01_dp,  7.500000e-01_dp, &
       5.000000e-01_dp,  5.000000e-01_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp, &
       1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp, &
       5.000000e-01_dp,  5.000000e-01_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp, &
       -1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp,  -2.000000e+00_dp, &
       1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp, &
       1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp, &
       2.500000e-01_dp,  7.500000e-01_dp,  2.500000e-01_dp,  -1.000000e+00_dp,  -1.000000e+00_dp, &
       1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp, &
       1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp, &
       -1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp, &
       -1.000000e+00_dp,  2.000000e+00_dp,  -2.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp, &
       -1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp, &
       1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  2.500000e-01_dp, &
       7.500000e-01_dp,  2.500000e-01_dp,  -1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp, &
       1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp, &
       1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp, &
       -1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp, &
       -1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp, &
       -1.000000e+00_dp,  2.000000e+00_dp,  2.000000e+00_dp,  -2.000000e+00_dp,  1.000000e+00_dp, &
       -1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp, &
       1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp, &
       2.500000e-01_dp,  7.500000e-01_dp,  2.500000e-01_dp,  -1.000000e+00_dp,  -1.000000e+00_dp, &
       1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp, &
       1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp /)
  REAL(kind=dp), PARAMETER, DIMENSION(150) :: STOICM_2 = (/ &
       -1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp, &
       -1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp, &
       -1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp, &
       -1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  2.000000e+00_dp,  2.000000e+00_dp, &
       -2.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp, &
       1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp, &
       1.000000e+00_dp,  1.000000e+00_dp,  2.500000e-01_dp,  7.500000e-01_dp,  2.500000e-01_dp, &
       -1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp, &
       -1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp, &
       -1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp, &
       2.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp, &
       1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp, &
       1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp, &
       -1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  2.000000e+00_dp,  -2.000000e+00_dp, &
       2.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp, &
       1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp, &
       1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp, &
       2.000000e+00_dp,  6.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp, &
       1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp, &
       -1.000000e+00_dp,  2.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp, &
       -1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp, &
       -1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp, &
       -1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp, &
       1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp, &
       1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp, &
       1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp, &
       3.400000e-02_dp,  3.400000e-02_dp,  -1.000000e+00_dp,  1.000000e-03_dp,  3.400000e-02_dp, &
       9.650000e-01_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp, &
       1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp, &
       1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp /)
  REAL(kind=dp), PARAMETER, DIMENSION(150) :: STOICM_3 = (/ &
       -1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp,  6.160000e-01_dp, &
       4.820000e-01_dp,  1.150000e-01_dp,  3.700000e-01_dp,  -1.000000e+00_dp,  4.200000e-02_dp, &
       3.700000e-01_dp,  4.920000e-01_dp,  9.600000e-02_dp,  -1.000000e+00_dp,  1.000000e+00_dp, &
       -1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp, &
       1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp,  3.500000e-01_dp,  6.500000e-01_dp, &
       -6.500000e-01_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp, &
       -1.000000e+00_dp,  1.000000e+00_dp,  3.400000e-01_dp,  -3.400000e-01_dp,  -1.000000e+00_dp, &
       1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp,  2.000000e+00_dp,  -1.000000e+00_dp, &
       2.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  1.260000e+00_dp, &
       -1.000000e+00_dp,  6.300000e-01_dp,  3.700000e-01_dp,  -1.000000e+00_dp,  1.260000e+00_dp, &
       1.000000e+00_dp,  -1.000000e+00_dp,  6.300000e-01_dp,  -1.000000e+00_dp,  3.700000e-01_dp, &
       1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp, &
       -1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp, &
       1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  2.000000e+00_dp, &
       -1.000000e+00_dp,  2.300000e-01_dp,  2.400000e-01_dp,  7.600000e-01_dp,  -1.000000e+00_dp, &
       -1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp, &
       2.300000e-01_dp,  2.400000e-01_dp,  7.600000e-01_dp,  -1.000000e+00_dp,  -1.000000e+00_dp, &
       1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp, &
       1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp, &
       7.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp, &
       -1.000000e+00_dp,  4.160000e-01_dp,  8.400000e-02_dp,  -1.000000e+00_dp,  8.400000e-02_dp, &
       4.160000e-01_dp,  5.000000e-01_dp,  5.000000e-01_dp,  -1.000000e+00_dp,  3.330000e-01_dp, &
       4.500000e-01_dp,  9.000000e-01_dp,  -1.000000e+00_dp,  2.000000e-01_dp,  -1.000000e+00_dp, &
       8.000000e-03_dp,  1.000000e-01_dp,  1.000000e-01_dp,  2.080000e-01_dp,  5.000000e-01_dp, &
       5.000000e-01_dp,  -1.000000e+00_dp,  5.000000e-01_dp,  5.000000e-01_dp,  -1.000000e+00_dp, &
       -1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  6.700000e-01_dp,  -1.000000e+00_dp, &
       6.700000e-01_dp,  3.400000e-01_dp,  3.300000e-01_dp,  3.300000e-01_dp,  6.700000e-01_dp, &
       3.300000e-01_dp,  3.000000e-01_dp,  6.750000e-01_dp,  -1.000000e+00_dp,  3.000000e-01_dp, &
       6.750000e-01_dp,  2.500000e-02_dp,  3.000000e-01_dp,  6.750000e-01_dp,  -1.000000e+00_dp, &
       3.510000e-01_dp,  4.750000e-01_dp,  9.500000e-01_dp,  -1.000000e+00_dp,  1.000000e-01_dp /)
  REAL(kind=dp), PARAMETER, DIMENSION(150) :: STOICM_4 = (/ &
       -1.000000e+00_dp,  6.400000e-02_dp,  5.000000e-02_dp,  5.000000e-02_dp,  1.640000e-01_dp, &
       -1.000000e+00_dp,  -1.000000e+00_dp,  4.500000e-01_dp,  5.500000e-01_dp,  7.000000e-01_dp, &
       -1.000000e+00_dp,  7.000000e-01_dp,  3.000000e-01_dp,  3.000000e-01_dp,  3.360000e-01_dp, &
       1.740000e-01_dp,  1.500000e-01_dp,  -1.000000e+00_dp,  1.290000e-01_dp,  5.500000e-02_dp, &
       1.300000e-02_dp,  1.500000e-01_dp,  3.320000e-01_dp,  4.100000e-02_dp,  2.890000e-01_dp, &
       6.700000e-01_dp,  -1.000000e+00_dp,  1.000000e-01_dp,  3.720000e-01_dp,  4.980000e-01_dp, &
       7.420000e-01_dp,  2.300000e-02_dp,  -1.000000e+00_dp,  4.700000e-02_dp,  1.250000e-01_dp, &
       2.100000e-01_dp,  -1.000000e+00_dp,  4.000000e-01_dp,  4.800000e-02_dp,  4.800000e-02_dp, &
       2.850000e-01_dp,  5.720000e-01_dp,  8.000000e-03_dp,  1.500000e-01_dp,  -1.000000e+00_dp, &
       2.270000e-01_dp,  5.720000e-01_dp,  2.180000e-01_dp,  5.100000e-02_dp,  1.500000e-01_dp, &
       7.990000e-01_dp,  -1.000000e+00_dp,  1.233000e+00_dp,  -1.000000e+00_dp,  4.670000e-01_dp, &
       3.000000e-01_dp,  2.330000e-01_dp,  1.233000e+00_dp,  4.670000e-01_dp,  3.000000e-01_dp, &
       8.400000e-02_dp,  2.130000e-01_dp,  5.580000e-01_dp,  1.150000e-01_dp,  -6.710000e-01_dp, &
       3.790000e-01_dp,  7.000000e-02_dp,  4.730000e-01_dp,  2.900000e-02_dp,  4.900000e-02_dp, &
       -1.000000e+00_dp,  5.150000e-01_dp,  2.460000e-01_dp,  5.060000e-01_dp,  7.100000e-01_dp, &
       -1.000000e+00_dp,  4.000000e-02_dp,  9.600000e-01_dp,  6.670000e-01_dp,  3.330000e-01_dp, &
       6.000000e-03_dp,  5.960000e-01_dp,  4.390000e-01_dp,  1.000000e-02_dp,  -6.900000e-01_dp, &
       2.130000e-01_dp,  1.770000e-01_dp,  4.800000e-02_dp,  1.130000e-01_dp,  1.730000e-01_dp, &
       3.760000e-01_dp,  3.380000e-01_dp,  -1.000000e+00_dp,  2.000000e-02_dp,  1.520000e-01_dp, &
       4.310000e-01_dp,  1.340000e-01_dp,  -1.000000e+00_dp,  1.470000e-01_dp,  2.430000e-01_dp, &
       4.350000e-01_dp,  3.410000e-01_dp,  9.500000e-02_dp,  5.640000e-01_dp,  1.000000e+00_dp, &
       -1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp, &
       -1.000000e+00_dp,  1.500000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  1.500000e+00_dp, &
       5.000000e-01_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp, &
       -1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  5.000000e-01_dp,  5.000000e-01_dp, &
       1.000000e+00_dp,  5.000000e-01_dp,  1.000000e+00_dp,  5.000000e-01_dp,  -1.000000e+00_dp, &
       1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp, &
       1.000000e+00_dp,  5.000000e-01_dp,  5.000000e-01_dp,  1.000000e+00_dp,  5.000000e-01_dp, &
       1.000000e+00_dp,  5.000000e-01_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp, &
       1.950000e-01_dp,  1.610000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  3.700000e-01_dp /)
  REAL(kind=dp), PARAMETER, DIMENSION(150) :: STOICM_5 = (/ &
       5.000000e-01_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  1.200000e-01_dp, &
       1.200000e-01_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp, &
       4.910000e-01_dp,  -1.000000e+00_dp,  9.000000e-03_dp,  2.500000e-01_dp,  1.910000e-01_dp, &
       -1.000000e+00_dp,  5.000000e-01_dp,  3.000000e-01_dp,  2.000000e-01_dp,  -1.000000e+00_dp, &
       7.900000e-02_dp,  2.300000e-01_dp,  3.570000e-01_dp,  3.200000e-01_dp,  6.240000e-01_dp, &
       9.300000e-02_dp,  9.070000e-01_dp,  -1.000000e+00_dp,  2.040000e-01_dp,  1.500000e-01_dp, &
       2.750000e-01_dp,  -1.000000e+00_dp,  1.260000e-01_dp,  3.900000e-01_dp,  1.600000e-01_dp, &
       5.920000e-01_dp,  1.000000e-01_dp,  -1.000000e+00_dp,  8.000000e-03_dp,  1.920000e-01_dp, &
       6.600000e-02_dp,  2.660000e-01_dp,  -1.000000e+00_dp,  1.870000e-01_dp,  9.360000e-01_dp, &
       6.400000e-02_dp,  7.490000e-01_dp,  1.870000e-01_dp,  -1.000000e+00_dp,  -1.000000e+00_dp, &
       2.400000e-01_dp,  2.400000e-01_dp,  -1.000000e+00_dp,  7.500000e-01_dp,  1.000000e-02_dp, &
       2.400000e-01_dp,  2.500000e-01_dp,  5.000000e-01_dp,  -1.000000e+00_dp,  2.760000e-01_dp, &
       4.740000e-01_dp,  2.760000e-01_dp,  2.500000e-01_dp,  7.500000e-01_dp,  -1.000000e+00_dp, &
       1.030000e-01_dp,  1.890000e-01_dp,  3.100000e-02_dp,  1.570000e-01_dp,  1.300000e-01_dp, &
       1.000000e-03_dp,  7.290000e-01_dp,  -1.000000e+00_dp,  2.350000e-01_dp,  2.050000e-01_dp, &
       2.760000e-01_dp,  -1.000000e+00_dp,  3.300000e-02_dp,  1.800000e-01_dp,  3.100000e-02_dp, &
       1.230000e-01_dp,  2.010000e-01_dp,  5.670000e-01_dp,  7.500000e-01_dp,  -1.000000e+00_dp, &
       2.760000e-01_dp,  4.740000e-01_dp,  2.500000e-01_dp,  2.760000e-01_dp,  4.740000e-01_dp, &
       -1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp,  1.470000e-01_dp,  8.530000e-01_dp, &
       -1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  1.210000e-01_dp, &
       -1.000000e+00_dp,  1.600000e-01_dp,  4.170000e-01_dp,  2.480000e-01_dp,  3.900000e-02_dp, &
       1.550000e-01_dp,  1.210000e-01_dp,  2.100000e-02_dp,  6.120000e-01_dp,  -7.540000e-01_dp, &
       -1.000000e+00_dp,  2.360000e-01_dp,  2.400000e-02_dp,  5.590000e-01_dp,  4.450000e-01_dp, &
       2.600000e-02_dp,  1.220000e-01_dp,  3.320000e-01_dp,  7.000000e-02_dp,  6.950000e-01_dp, &
       -1.000000e+00_dp,  -1.000000e+00_dp,  2.000000e-03_dp,  4.520000e-01_dp,  9.360000e-01_dp, &
       4.550000e-01_dp,  2.400000e-02_dp,  2.440000e-01_dp,  1.100000e-01_dp,  1.250000e-01_dp, &
       1.430000e-01_dp,  1.100000e-02_dp,  8.350000e-01_dp,  1.100000e-02_dp,  -1.000000e+00_dp, &
       -1.000000e+00_dp,  7.200000e-02_dp,  9.480000e-01_dp,  9.900000e-02_dp,  2.600000e-02_dp, &
       2.040000e-01_dp,  8.900000e-02_dp,  4.170000e-01_dp,  3.470000e-01_dp,  6.530000e-01_dp, &
       -1.000000e+00_dp,  -1.000000e+00_dp,  1.080000e-01_dp,  5.100000e-02_dp,  2.070000e-01_dp /)
  REAL(kind=dp), PARAMETER, DIMENSION(124) :: STOICM_6 = (/ &
       4.910000e-01_dp,  5.900000e-02_dp,  1.700000e-02_dp,  1.190000e-01_dp,  1.180000e-01_dp, &
       5.500000e-02_dp,  2.240000e-01_dp,  1.100000e-02_dp,  7.650000e-01_dp,  -1.000000e+00_dp, &
       8.700000e-02_dp,  -1.000000e+00_dp,  9.900000e-02_dp,  9.300000e-02_dp,  1.870000e-01_dp, &
       5.610000e-01_dp,  5.000000e-02_dp,  2.870000e-01_dp,  9.700000e-02_dp,  1.870000e-01_dp, &
       9.000000e-03_dp,  8.040000e-01_dp,  -1.000000e+00_dp,  5.000000e-03_dp,  2.050000e-01_dp, &
       -1.000000e+00_dp,  2.940000e-01_dp,  7.320000e-01_dp,  4.970000e-01_dp,  1.190000e-01_dp, &
       9.000000e-02_dp,  9.100000e-01_dp,  -1.000000e+00_dp,  1.850000e-01_dp,  5.000000e-02_dp, &
       1.190000e-01_dp,  3.450000e-01_dp,  1.000000e-03_dp,  -1.000000e+00_dp,  1.540000e-01_dp, &
       5.000000e-01_dp,  3.630000e-01_dp,  2.150000e-01_dp,  -1.000000e+00_dp,  5.600000e-02_dp, &
       1.000000e-03_dp,  7.600000e-02_dp,  2.200000e-02_dp,  1.550000e-01_dp,  2.400000e-02_dp, &
       4.880000e-01_dp,  -1.000000e+00_dp,  9.000000e-03_dp,  5.110000e-01_dp,  3.700000e-02_dp, &
       1.760000e-01_dp,  8.240000e-01_dp,  -1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp, &
       4.500000e-01_dp,  4.370000e-01_dp,  1.130000e-01_dp,  6.100000e-02_dp,  1.270000e-01_dp, &
       1.000000e-03_dp,  2.500000e-02_dp,  2.500000e-02_dp,  -1.000000e+00_dp,  7.320000e-01_dp, &
       2.440000e-01_dp,  5.110000e-01_dp,  7.200000e-02_dp,  8.200000e-02_dp,  9.180000e-01_dp, &
       -1.000000e+00_dp,  7.300000e-02_dp,  1.290000e-01_dp,  2.470000e-01_dp,  4.200000e-02_dp, &
       2.650000e-01_dp,  4.500000e-02_dp,  1.370000e-01_dp,  2.600000e-02_dp,  -1.000000e+00_dp, &
       1.900000e-02_dp,  4.560000e-01_dp,  2.690000e-01_dp,  3.050000e-01_dp,  2.600000e-02_dp, &
       4.300000e-02_dp,  -1.000000e+00_dp,  3.000000e-03_dp,  2.000000e-03_dp,  1.970000e-01_dp, &
       3.300000e-02_dp,  1.370000e-01_dp,  6.000000e-03_dp,  3.780000e-01_dp,  1.500000e-02_dp, &
       1.020000e-01_dp,  7.110000e-01_dp,  -1.000000e+00_dp,  4.800000e-02_dp,  5.070000e-01_dp, &
       7.900000e-02_dp,  3.210000e-01_dp,  1.510000e-01_dp,  1.000000e-03_dp,  1.360000e-01_dp, &
       3.000000e-02_dp,  4.420000e-01_dp,  3.910000e-01_dp,  -1.000000e+00_dp,  1.200000e-02_dp, &
       1.200000e-02_dp,  -1.000000e+00_dp,  -1.000000e+00_dp,  6.900000e-02_dp,  6.590000e-01_dp, &
       2.590000e-01_dp,  1.300000e-02_dp,  1.000000e-03_dp,  1.200000e-02_dp /)
  REAL(kind=dp), PARAMETER, DIMENSION(1024) :: STOICM = (/&
    STOICM_0, STOICM_1, STOICM_2, STOICM_3, STOICM_4, &
    STOICM_5, STOICM_6 /)


END MODULE saprc_f90_StoichiomSP

