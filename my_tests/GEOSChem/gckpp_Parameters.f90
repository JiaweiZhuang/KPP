! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
! 
! Parameter Module File
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
! File                 : gckpp_Parameters.f90
! Time                 : Sat Jan 20 21:19:33 2018
! Working directory    : /home/zhuangjw/KPP/my_tests/GEOSChem
! Equation file        : gckpp.kpp
! Output root filename : gckpp
! 
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



MODULE gckpp_Parameters

  USE gckpp_Precision
  PUBLIC
  SAVE


! NSPEC - Number of chemical species
  INTEGER, PARAMETER :: NSPEC = 233 
! NVAR - Number of Variable species
  INTEGER, PARAMETER :: NVAR = 228 
! NVARACT - Number of Active species
  INTEGER, PARAMETER :: NVARACT = 205 
! NFIX - Number of Fixed species
  INTEGER, PARAMETER :: NFIX = 5 
! NREACT - Number of reactions
  INTEGER, PARAMETER :: NREACT = 722 
! NVARST - Starting of variables in conc. vect.
  INTEGER, PARAMETER :: NVARST = 1 
! NFIXST - Starting of fixed in conc. vect.
  INTEGER, PARAMETER :: NFIXST = 229 
! NONZERO - Number of nonzero entries in Jacobian
  INTEGER, PARAMETER :: NONZERO = 2515 
! LU_NONZERO - Number of nonzero entries in LU factoriz. of Jacobian
  INTEGER, PARAMETER :: LU_NONZERO = 3181 
! CNVAR - (NVAR+1) Number of elements in compressed row format
  INTEGER, PARAMETER :: CNVAR = 229 
! NLOOKAT - Number of species to look at
  INTEGER, PARAMETER :: NLOOKAT = 0 
! NMONITOR - Number of species to monitor
  INTEGER, PARAMETER :: NMONITOR = 0 
! NMASS - Number of atoms to check mass balance
  INTEGER, PARAMETER :: NMASS = 1 

! Index declaration for variable species in C and VAR
!   VAR(ind_spc) = C(ind_spc)

  INTEGER, PARAMETER :: ind_CH2I2 = 1 
  INTEGER, PARAMETER :: ind_CH2ICl = 2 
  INTEGER, PARAMETER :: ind_CH2IBr = 3 
  INTEGER, PARAMETER :: ind_MONX = 4 
  INTEGER, PARAMETER :: ind_AERI = 5 
  INTEGER, PARAMETER :: ind_CO2 = 6 
  INTEGER, PARAMETER :: ind_INDIOL = 7 
  INTEGER, PARAMETER :: ind_ISALA = 8 
  INTEGER, PARAMETER :: ind_ISALC = 9 
  INTEGER, PARAMETER :: ind_ISN1OA = 10 
  INTEGER, PARAMETER :: ind_ISN1OG = 11 
  INTEGER, PARAMETER :: ind_LBRO2H = 12 
  INTEGER, PARAMETER :: ind_LBRO2N = 13 
  INTEGER, PARAMETER :: ind_LISOPOH = 14 
  INTEGER, PARAMETER :: ind_LISOPNO3 = 15 
  INTEGER, PARAMETER :: ind_LTRO2H = 16 
  INTEGER, PARAMETER :: ind_LTRO2N = 17 
  INTEGER, PARAMETER :: ind_LVOCOA = 18 
  INTEGER, PARAMETER :: ind_LVOC = 19 
  INTEGER, PARAMETER :: ind_LXRO2H = 20 
  INTEGER, PARAMETER :: ind_LXRO2N = 21 
  INTEGER, PARAMETER :: ind_MSA = 22 
  INTEGER, PARAMETER :: ind_PYAC = 23 
  INTEGER, PARAMETER :: ind_SO4H1 = 24 
  INTEGER, PARAMETER :: ind_SO4H2 = 25 
  INTEGER, PARAMETER :: ind_SOAGX = 26 
  INTEGER, PARAMETER :: ind_SOAIE = 27 
  INTEGER, PARAMETER :: ind_SOAME = 28 
  INTEGER, PARAMETER :: ind_IMAE = 29 
  INTEGER, PARAMETER :: ind_SOAMG = 30 
  INTEGER, PARAMETER :: ind_I2O4 = 31 
  INTEGER, PARAMETER :: ind_CH3CCl3 = 32 
  INTEGER, PARAMETER :: ind_DHDN = 33 
  INTEGER, PARAMETER :: ind_DHDC = 34 
  INTEGER, PARAMETER :: ind_I2O2 = 35 
  INTEGER, PARAMETER :: ind_MONITA = 36 
  INTEGER, PARAMETER :: ind_BENZ = 37 
  INTEGER, PARAMETER :: ind_CH3I = 38 
  INTEGER, PARAMETER :: ind_H1301 = 39 
  INTEGER, PARAMETER :: ind_H2402 = 40 
  INTEGER, PARAMETER :: ind_I2O3 = 41 
  INTEGER, PARAMETER :: ind_PMNN = 42 
  INTEGER, PARAMETER :: ind_PPN = 43 
  INTEGER, PARAMETER :: ind_TOLU = 44 
  INTEGER, PARAMETER :: ind_BrNO2 = 45 
  INTEGER, PARAMETER :: ind_CCl4 = 46 
  INTEGER, PARAMETER :: ind_CFC11 = 47 
  INTEGER, PARAMETER :: ind_CFC12 = 48 
  INTEGER, PARAMETER :: ind_CFC113 = 49 
  INTEGER, PARAMETER :: ind_CFC114 = 50 
  INTEGER, PARAMETER :: ind_CFC115 = 51 
  INTEGER, PARAMETER :: ind_H1211 = 52 
  INTEGER, PARAMETER :: ind_IBr = 53 
  INTEGER, PARAMETER :: ind_IEPOXD = 54 
  INTEGER, PARAMETER :: ind_INO = 55 
  INTEGER, PARAMETER :: ind_N2O = 56 
  INTEGER, PARAMETER :: ind_TRO2 = 57 
  INTEGER, PARAMETER :: ind_BRO2 = 58 
  INTEGER, PARAMETER :: ind_IEPOXA = 59 
  INTEGER, PARAMETER :: ind_IEPOXB = 60 
  INTEGER, PARAMETER :: ind_IONITA = 61 
  INTEGER, PARAMETER :: ind_N = 62 
  INTEGER, PARAMETER :: ind_OCS = 63 
  INTEGER, PARAMETER :: ind_XRO2 = 64 
  INTEGER, PARAMETER :: ind_HI = 65 
  INTEGER, PARAMETER :: ind_MAP = 66 
  INTEGER, PARAMETER :: ind_CHCl3 = 67 
  INTEGER, PARAMETER :: ind_ICl = 68 
  INTEGER, PARAMETER :: ind_IMAO3 = 69 
  INTEGER, PARAMETER :: ind_CHBr3 = 70 
  INTEGER, PARAMETER :: ind_MPN = 71 
  INTEGER, PARAMETER :: ind_Cl2O2 = 72 
  INTEGER, PARAMETER :: ind_CH2Br2 = 73 
  INTEGER, PARAMETER :: ind_CH2Cl2 = 74 
  INTEGER, PARAMETER :: ind_HCFC141b = 75 
  INTEGER, PARAMETER :: ind_HCFC142b = 76 
  INTEGER, PARAMETER :: ind_HCFC22 = 77 
  INTEGER, PARAMETER :: ind_ETP = 78 
  INTEGER, PARAMETER :: ind_DMS = 79 
  INTEGER, PARAMETER :: ind_IONO = 80 
  INTEGER, PARAMETER :: ind_OIO = 81 
  INTEGER, PARAMETER :: ind_RA3P = 82 
  INTEGER, PARAMETER :: ind_RB3P = 83 
  INTEGER, PARAMETER :: ind_XYLE = 84 
  INTEGER, PARAMETER :: ind_ClNO2 = 85 
  INTEGER, PARAMETER :: ind_HCFC123 = 86 
  INTEGER, PARAMETER :: ind_CH3Cl = 87 
  INTEGER, PARAMETER :: ind_CH3Br = 88 
  INTEGER, PARAMETER :: ind_HNO4 = 89 
  INTEGER, PARAMETER :: ind_ClOO = 90 
  INTEGER, PARAMETER :: ind_OClO = 91 
  INTEGER, PARAMETER :: ind_HNO2 = 92 
  INTEGER, PARAMETER :: ind_PAN = 93 
  INTEGER, PARAMETER :: ind_RP = 94 
  INTEGER, PARAMETER :: ind_PP = 95 
  INTEGER, PARAMETER :: ind_PRPN = 96 
  INTEGER, PARAMETER :: ind_SO4 = 97 
  INTEGER, PARAMETER :: ind_ALK4 = 98 
  INTEGER, PARAMETER :: ind_PIP = 99 
  INTEGER, PARAMETER :: ind_R4P = 100 
  INTEGER, PARAMETER :: ind_HPALD = 101 
  INTEGER, PARAMETER :: ind_BrCl = 102 
  INTEGER, PARAMETER :: ind_N2O5 = 103 
  INTEGER, PARAMETER :: ind_DHPCARP = 104 
  INTEGER, PARAMETER :: ind_C3H8 = 105 
  INTEGER, PARAMETER :: ind_Br2 = 106 
  INTEGER, PARAMETER :: ind_HC187 = 107 
  INTEGER, PARAMETER :: ind_IAP = 108 
  INTEGER, PARAMETER :: ind_VRP = 109 
  INTEGER, PARAMETER :: ind_ATOOH = 110 
  INTEGER, PARAMETER :: ind_HOI = 111 
  INTEGER, PARAMETER :: ind_HPC52O2 = 112 
  INTEGER, PARAMETER :: ind_MOBA = 113 
  INTEGER, PARAMETER :: ind_DHMOB = 114 
  INTEGER, PARAMETER :: ind_HONIT = 115 
  INTEGER, PARAMETER :: ind_RIPB = 116 
  INTEGER, PARAMETER :: ind_ISNP = 117 
  INTEGER, PARAMETER :: ind_MP = 118 
  INTEGER, PARAMETER :: ind_BrSALA = 119 
  INTEGER, PARAMETER :: ind_BrSALC = 120 
  INTEGER, PARAMETER :: ind_MAOP = 121 
  INTEGER, PARAMETER :: ind_MRP = 122 
  INTEGER, PARAMETER :: ind_EOH = 123 
  INTEGER, PARAMETER :: ind_RIPA = 124 
  INTEGER, PARAMETER :: ind_RIPD = 125 
  INTEGER, PARAMETER :: ind_ETHLN = 126 
  INTEGER, PARAMETER :: ind_ISNOHOO = 127 
  INTEGER, PARAMETER :: ind_C2H6 = 128 
  INTEGER, PARAMETER :: ind_MTPA = 129 
  INTEGER, PARAMETER :: ind_NPMN = 130 
  INTEGER, PARAMETER :: ind_IONO2 = 131 
  INTEGER, PARAMETER :: ind_MOBAOO = 132 
  INTEGER, PARAMETER :: ind_DIBOO = 133 
  INTEGER, PARAMETER :: ind_ISNOOB = 134 
  INTEGER, PARAMETER :: ind_LIMO = 135 
  INTEGER, PARAMETER :: ind_IPMN = 136 
  INTEGER, PARAMETER :: ind_INPN = 137 
  INTEGER, PARAMETER :: ind_MACRNO2 = 138 
  INTEGER, PARAMETER :: ind_H = 139 
  INTEGER, PARAMETER :: ind_BrNO3 = 140 
  INTEGER, PARAMETER :: ind_ROH = 141 
  INTEGER, PARAMETER :: ind_MONITS = 142 
  INTEGER, PARAMETER :: ind_I2 = 143 
  INTEGER, PARAMETER :: ind_Cl2 = 144 
  INTEGER, PARAMETER :: ind_ISOPNB = 145 
  INTEGER, PARAMETER :: ind_CH4 = 146 
  INTEGER, PARAMETER :: ind_MVKOO = 147 
  INTEGER, PARAMETER :: ind_CH3CHOO = 148 
  INTEGER, PARAMETER :: ind_GAOO = 149 
  INTEGER, PARAMETER :: ind_MVKN = 150 
  INTEGER, PARAMETER :: ind_IEPOXOO = 151 
  INTEGER, PARAMETER :: ind_GLYX = 152 
  INTEGER, PARAMETER :: ind_MGLYOO = 153 
  INTEGER, PARAMETER :: ind_MGLOO = 154 
  INTEGER, PARAMETER :: ind_PRN1 = 155 
  INTEGER, PARAMETER :: ind_MONITU = 156 
  INTEGER, PARAMETER :: ind_A3O2 = 157 
  INTEGER, PARAMETER :: ind_CH2OO = 158 
  INTEGER, PARAMETER :: ind_PROPNN = 159 
  INTEGER, PARAMETER :: ind_MAN2 = 160 
  INTEGER, PARAMETER :: ind_ISNOOA = 161 
  INTEGER, PARAMETER :: ind_PO2 = 162 
  INTEGER, PARAMETER :: ind_B3O2 = 163 
  INTEGER, PARAMETER :: ind_ISOPNDO2 = 164 
  INTEGER, PARAMETER :: ind_MACROO = 165 
  INTEGER, PARAMETER :: ind_R4N1 = 166 
  INTEGER, PARAMETER :: ind_MAOPO2 = 167 
  INTEGER, PARAMETER :: ind_MACRN = 168 
  INTEGER, PARAMETER :: ind_H2O2 = 169 
  INTEGER, PARAMETER :: ind_ISOP = 170 
  INTEGER, PARAMETER :: ind_ATO2 = 171 
  INTEGER, PARAMETER :: ind_HCOOH = 172 
  INTEGER, PARAMETER :: ind_I = 173 
  INTEGER, PARAMETER :: ind_RCO3 = 174 
  INTEGER, PARAMETER :: ind_IO = 175 
  INTEGER, PARAMETER :: ind_OLNN = 176 
  INTEGER, PARAMETER :: ind_OLND = 177 
  INTEGER, PARAMETER :: ind_LIMO2 = 178 
  INTEGER, PARAMETER :: ind_KO2 = 179 
  INTEGER, PARAMETER :: ind_HOBr = 180 
  INTEGER, PARAMETER :: ind_ISOPNBO2 = 181 
  INTEGER, PARAMETER :: ind_PIO2 = 182 
  INTEGER, PARAMETER :: ind_HC5OO = 183 
  INTEGER, PARAMETER :: ind_HNO3 = 184 
  INTEGER, PARAMETER :: ind_ISOPND = 185 
  INTEGER, PARAMETER :: ind_ACTA = 186 
  INTEGER, PARAMETER :: ind_VRO2 = 187 
  INTEGER, PARAMETER :: ind_HOCl = 188 
  INTEGER, PARAMETER :: ind_ISN1 = 189 
  INTEGER, PARAMETER :: ind_GLYC = 190 
  INTEGER, PARAMETER :: ind_NMAO3 = 191 
  INTEGER, PARAMETER :: ind_ClNO3 = 192 
  INTEGER, PARAMETER :: ind_MGLY = 193 
  INTEGER, PARAMETER :: ind_ACET = 194 
  INTEGER, PARAMETER :: ind_HC5 = 195 
  INTEGER, PARAMETER :: ind_RIO2 = 196 
  INTEGER, PARAMETER :: ind_ETO2 = 197 
  INTEGER, PARAMETER :: ind_INO2 = 198 
  INTEGER, PARAMETER :: ind_R4O2 = 199 
  INTEGER, PARAMETER :: ind_R4N2 = 200 
  INTEGER, PARAMETER :: ind_HAC = 201 
  INTEGER, PARAMETER :: ind_MRO2 = 202 
  INTEGER, PARAMETER :: ind_BrO = 203 
  INTEGER, PARAMETER :: ind_PRPE = 204 
  INTEGER, PARAMETER :: ind_RCHO = 205 
  INTEGER, PARAMETER :: ind_MEK = 206 
  INTEGER, PARAMETER :: ind_CH2O = 207 
  INTEGER, PARAMETER :: ind_MACR = 208 
  INTEGER, PARAMETER :: ind_ALD2 = 209 
  INTEGER, PARAMETER :: ind_MVK = 210 
  INTEGER, PARAMETER :: ind_MCO3 = 211 
  INTEGER, PARAMETER :: ind_SO2 = 212 
  INTEGER, PARAMETER :: ind_MO2 = 213 
  INTEGER, PARAMETER :: ind_CO = 214 
  INTEGER, PARAMETER :: ind_Cl = 215 
  INTEGER, PARAMETER :: ind_OH = 216 
  INTEGER, PARAMETER :: ind_NO3 = 217 
  INTEGER, PARAMETER :: ind_NO = 218 
  INTEGER, PARAMETER :: ind_HBr = 219 
  INTEGER, PARAMETER :: ind_HO2 = 220 
  INTEGER, PARAMETER :: ind_ClO = 221 
  INTEGER, PARAMETER :: ind_Br = 222 
  INTEGER, PARAMETER :: ind_H2O = 223 
  INTEGER, PARAMETER :: ind_O = 224 
  INTEGER, PARAMETER :: ind_NO2 = 225 
  INTEGER, PARAMETER :: ind_HCl = 226 
  INTEGER, PARAMETER :: ind_O3 = 227 
  INTEGER, PARAMETER :: ind_O1D = 228 

! Index declaration for fixed species in C
!   C(ind_spc)

  INTEGER, PARAMETER :: ind_H2 = 229 
  INTEGER, PARAMETER :: ind_MOH = 230 
  INTEGER, PARAMETER :: ind_N2 = 231 
  INTEGER, PARAMETER :: ind_O2 = 232 
  INTEGER, PARAMETER :: ind_RCOOH = 233 

! Index declaration for fixed species in FIX
!    FIX(indf_spc) = C(ind_spc) = C(NVAR+indf_spc)

  INTEGER, PARAMETER :: indf_H2 = 1 
  INTEGER, PARAMETER :: indf_MOH = 2 
  INTEGER, PARAMETER :: indf_N2 = 3 
  INTEGER, PARAMETER :: indf_O2 = 4 
  INTEGER, PARAMETER :: indf_RCOOH = 5 

END MODULE gckpp_Parameters

