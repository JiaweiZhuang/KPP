! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
! 
! Utility Data Module File
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
! File                 : strato_Monitor.f90
! Time                 : Tue Feb 27 15:54:08 2018
! Working directory    : /home/zhuangjw/KPP/my_tests/strato/strato_code
! Equation file        : strato.kpp
! Output root filename : strato
! 
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



MODULE strato_Monitor


  CHARACTER(LEN=15), PARAMETER, DIMENSION(40) :: SPC_NAMES = (/ &
     'CH3            ','Cl2            ','Cl2O2          ', &
     'ClOO           ','OClO           ','BrCl           ', &
     'HOBr           ','BrONO2         ','HCO            ', &
     'CH3O           ','O1D            ','N2O5           ', &
     'HBr            ','CH3OOH         ','HNO4           ', &
     'HCl            ','H2O2           ','HOCl           ', &
     'HNO3           ','H              ','CH3O2          ', &
     'ClONO2         ','NO3            ','CH2O           ', &
     'Br             ','OH             ','Cl             ', &
     'ClO            ','O3             ','NO             ', &
     'BrO            ','O              ','HO2            ', &
     'NO2            ','H2O            ','H2             ', &
     'O2             ','N2             ','CH4            ', &
     'CO             ' /)

  INTEGER, PARAMETER, DIMENSION(40) :: LOOKAT = (/ &
       1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, &
      13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, &
      25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, &
      37, 38, 39, 40 /)

  INTEGER, PARAMETER, DIMENSION(1) :: MONITOR = (/ &
      32 /)

  CHARACTER(LEN=15), DIMENSION(1) :: SMASS
  CHARACTER(LEN=100), PARAMETER, DIMENSION(30) :: EQN_NAMES_0 = (/ &
     '     O + O2 --> O3                                                                                  ', &
     '     O3 + O --> 2 O2                                                                                ', &
     '   O1D + N2 --> O + N2                                                                              ', &
     '   O1D + O2 --> O + O2                                                                              ', &
     '   O1D + O3 --> 2 O2                                                                                ', &
     '  O1D + H2O --> 2 OH                                                                                ', &
     '   O1D + H2 --> H + OH                                                                              ', &
     '  O1D + CH4 --> CH2O + H2                                                                           ', &
     '  O1D + CH4 --> CH3 + OH                                                                            ', &
     '     H + O2 --> HO2                                                                                 ', &
     '     H + O3 --> OH + O2                                                                             ', &
     '    OH + H2 --> H + H2O                                                                             ', &
     '    OH + O3 --> HO2 + O2                                                                            ', &
     '     OH + O --> H + O2                                                                              ', &
     '       2 OH --> O + H2O                                                                             ', &
     '    O + HO2 --> OH + O2                                                                             ', &
     '   O3 + HO2 --> OH + 2 O2                                                                           ', &
     '    H + HO2 --> 2 OH                                                                                ', &
     '   OH + HO2 --> H2O + O2                                                                            ', &
     '      2 HO2 --> H2O2 + O2                                                                           ', &
     '2 HO2 + H2O --> H2O2 + H2O + O2                                                                     ', &
     '  H2O2 + OH --> HO2 + H2O                                                                           ', &
     '    O3 + NO --> NO2 + O2                                                                            ', &
     '   NO + HO2 --> OH + NO2                                                                            ', &
     '    O + NO2 --> NO + O2                                                                             ', &
     '   O3 + NO2 --> NO3 + O2                                                                            ', &
     '   OH + NO2 --> HNO3                                                                                ', &
     '  HO2 + NO2 --> HNO4                                                                                ', &
     '    NO3 + O --> NO2 + O2                                                                            ', &
     '   NO3 + NO --> 2 NO2                                                                               ' /)
  CHARACTER(LEN=100), PARAMETER, DIMENSION(30) :: EQN_NAMES_1 = (/ &
     '  NO3 + NO2 --> N2O5                                                                                ', &
     '       N2O5 --> NO3 + NO2                                                                           ', &
     '  HNO3 + OH --> NO3 + H2O                                                                           ', &
     '  HNO4 + OH --> NO2 + H2O + O2                                                                      ', &
     '       HNO4 --> HO2 + NO2                                                                           ', &
     '       N2O5 --> 2 HNO3                                                                              ', &
     '    Cl + O2 --> ClOO                                                                                ', &
     '    Cl + O3 --> ClO + O2                                                                            ', &
     '    Cl + H2 --> HCl + H                                                                             ', &
     '   Cl + HO2 --> HCl + O2                                                                            ', &
     '   Cl + HO2 --> OH + ClO                                                                            ', &
     '  H2O2 + Cl --> HCl + HO2                                                                           ', &
     '    ClO + O --> Cl + O2                                                                             ', &
     '   OH + ClO --> Cl + HO2                                                                            ', &
     '   OH + ClO --> HCl + O2                                                                            ', &
     '  ClO + HO2 --> HOCl + O2                                                                           ', &
     '   ClO + NO --> Cl + NO2                                                                            ', &
     '  ClO + NO2 --> ClONO2                                                                              ', &
     '      2 ClO --> OClO + Cl                                                                           ', &
     '      2 ClO --> ClOO + Cl                                                                           ', &
     '      2 ClO --> Cl2 + O2                                                                            ', &
     '      2 ClO --> Cl2O2                                                                               ', &
     '       ClOO --> Cl + O2                                                                             ', &
     '      Cl2O2 --> 2 ClO                                                                               ', &
     '   HCl + OH --> Cl + H2O                                                                            ', &
     '  HOCl + OH --> ClO + H2O                                                                           ', &
     ' ClONO2 + O --> NO3 + ClO                                                                           ', &
     'ClONO2 + OH --> HOCl + NO3                                                                          ', &
     'ClONO2 + Cl --> Cl2 + NO3                                                                           ', &
     '     ClONO2 --> HOCl + HNO3                                                                         ' /)
  CHARACTER(LEN=100), PARAMETER, DIMENSION(30) :: EQN_NAMES_2 = (/ &
     '    Br + O3 --> BrO + O2                                                                            ', &
     '   Br + HO2 --> HBr + O2                                                                            ', &
     '  CH2O + Br --> HCO + HBr                                                                           ', &
     '    BrO + O --> Br + O2                                                                             ', &
     '  BrO + HO2 --> HOBr + O2                                                                           ', &
     '   NO + BrO --> Br + NO2                                                                            ', &
     '  BrO + NO2 --> BrONO2                                                                              ', &
     '  ClO + BrO --> OClO + Br                                                                           ', &
     '  ClO + BrO --> ClOO + Br                                                                           ', &
     '  ClO + BrO --> BrCl + O2                                                                           ', &
     '      2 BrO --> 2 Br + O2                                                                           ', &
     '   HBr + OH --> Br + H2O                                                                            ', &
     '    OH + CO --> H                                                                                   ', &
     '   OH + CH4 --> CH3 + H2O                                                                           ', &
     '  CH2O + OH --> HCO + H2O                                                                           ', &
     '   CH2O + O --> HCO + OH                                                                            ', &
     '   Cl + CH4 --> CH3 + HCl                                                                           ', &
     '  CH2O + Cl --> HCO + HCl                                                                           ', &
     '   HCO + O2 --> HO2 + CO                                                                            ', &
     '   CH3 + O2 --> CH3O2                                                                               ', &
     '  CH3O + O2 --> CH2O + HO2                                                                          ', &
     ' CH3O2 + NO --> CH3O + NO2                                                                          ', &
     'CH3O2 + HO2 --> CH3OOH + O2                                                                         ', &
     'CH3OOH + OH --> CH3O2 + H2O                                                                         ', &
     '         O2 --> 2 O                                                                                 ', &
     '         O3 --> O + O2                                                                              ', &
     '         O3 --> O1D + O2                                                                            ', &
     '        HO2 --> OH + O                                                                              ', &
     '       H2O2 --> 2 OH                                                                                ', &
     '        NO2 --> NO + O                                                                              ' /)
  CHARACTER(LEN=100), PARAMETER, DIMENSION(19) :: EQN_NAMES_3 = (/ &
     '        NO3 --> O + NO2                                                                             ', &
     '        NO3 --> NO + O2                                                                             ', &
     '       N2O5 --> NO3 + NO2                                                                           ', &
     '       HNO3 --> OH + NO2                                                                            ', &
     '       HNO4 --> NO3 + OH                                                                            ', &
     '       HNO4 --> HO2 + NO2                                                                           ', &
     '        Cl2 --> 2 Cl                                                                                ', &
     '       OClO --> ClO + O                                                                             ', &
     '      Cl2O2 --> ClOO + Cl                                                                           ', &
     '       HOCl --> OH + Cl                                                                             ', &
     '     ClONO2 --> NO3 + Cl                                                                            ', &
     '     ClONO2 --> Cl + O + NO2                                                                        ', &
     '       BrCl --> Br + Cl                                                                             ', &
     '        BrO --> Br + O                                                                              ', &
     '       HOBr --> Br + OH                                                                             ', &
     '     BrONO2 --> NO3 + Br                                                                            ', &
     '       CH2O --> HCO + H                                                                             ', &
     '       CH2O --> H2 + CO                                                                             ', &
     '     CH3OOH --> CH3O + OH                                                                           ' /)
  CHARACTER(LEN=100), PARAMETER, DIMENSION(109) :: EQN_NAMES = (/&
    EQN_NAMES_0, EQN_NAMES_1, EQN_NAMES_2, EQN_NAMES_3 /)

! INLINED global variables

! End INLINED global variables


END MODULE strato_Monitor
