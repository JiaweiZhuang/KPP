C ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
C                                                                  
C Global Data Header File                                          
C                                                                  
C Generated by KPP-2.2.3 symbolic chemistry Kinetics PreProcessor  
C       (http://www.cs.vt.edu/~asandu/Software/KPP)                
C KPP is distributed under GPL, the general public licence         
C       (http://www.gnu.org/copyleft/gpl.html)                     
C (C) 1995-1997, V. Damian & A. Sandu, CGRER, Univ. Iowa           
C (C) 1997-2005, A. Sandu, Michigan Tech, Virginia Tech            
C     With important contributions from:                           
C        M. Damian, Villanova University, USA                      
C        R. Sander, Max-Planck Institute for Chemistry, Mainz, Germany
C                                                                  
C File                 : small_strato_Global.h                     
C Time                 : Sat Feb 24 03:01:25 2018                  
C Working directory    : /home/zhuangjw/KPP/my_tests/small_strato_f77
C Equation file        : small_strato.kpp                          
C Output root filename : small_strato                              
C                                                                  
C ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~




C Declaration of global variables                                  

C C - Concentration of all species                                 
      REAL*8 C(NSPEC)
      COMMON /GDATA/ C
C VAR - Concentrations of variable species (global)                
      REAL*8 VAR(NVAR)
C FIX - Concentrations of fixed species (global)                   
      REAL*8 FIX(NFIX)
C VAR, FIX are chunks of array C                                   
      EQUIVALENCE( C(1),VAR(1) )
      EQUIVALENCE( C(6),FIX(1) )
C RCONST - Rate constants (global)                                 
      REAL*8 RCONST(NREACT)
      COMMON /GDATA/ RCONST
C TIME - Current integration time                                  
      REAL*8 TIME
      COMMON /GDATA/ TIME
C SUN - Sunlight intensity between [0,1]                           
      REAL*8 SUN
      COMMON /GDATA/ SUN
C TEMP - Temperature                                               
      REAL*8 TEMP
      COMMON /GDATA/ TEMP
C RTOLS - (scalar) Relative tolerance                              
      REAL*8 RTOLS
      COMMON /GDATA/ RTOLS
C TSTART - Integration start time                                  
      REAL*8 TSTART
      COMMON /GDATA/ TSTART
C TEND - Integration end time                                      
      REAL*8 TEND
      COMMON /GDATA/ TEND
C DT - Integration step                                            
      REAL*8 DT
      COMMON /GDATA/ DT
C ATOL - Absolute tolerance                                        
      REAL*8 ATOL(NVAR)
      COMMON /GDATA/ ATOL
C RTOL - Relative tolerance                                        
      REAL*8 RTOL(NVAR)
      COMMON /GDATA/ RTOL
C STEPMIN - Lower bound for integration step                       
      REAL*8 STEPMIN
      COMMON /GDATA/ STEPMIN
C STEPMAX - Upper bound for integration step                       
      REAL*8 STEPMAX
      COMMON /GDATA/ STEPMAX
C CFACTOR - Conversion factor for concentration units              
      REAL*8 CFACTOR
      COMMON /GDATA/ CFACTOR
C DDMTYPE - DDM sensitivity w.r.t.: 0=init.val., 1=params          
      INTEGER DDMTYPE
      COMMON /INTGDATA/ DDMTYPE
C LOOKAT - Indexes of species to look at                           
      INTEGER LOOKAT(7)
      COMMON /INTGDATA/ LOOKAT
C MONITOR - Indexes of species to monitor                          
      INTEGER MONITOR(6)
      COMMON /INTGDATA/ MONITOR
C SPC_NAMES - Names of chemical species                            
      CHARACTER*12 SPC_NAMES(7)
      COMMON /CHARGDATA/ SPC_NAMES
C SMASS - Names of atoms for mass balance                          
      CHARACTER*12 SMASS(1)
      COMMON /CHARGDATA/ SMASS
C EQN_NAMES - Equation names                                       
      CHARACTER*100 EQN_NAMES(10)
      COMMON /CHARGDATA/ EQN_NAMES
C EQN_TAGS - Equation tags                                         
      CHARACTER*12 EQN_TAGS(NREACT)
      COMMON /CHARGDATA/ EQN_TAGS

C INLINED global variable declarations                             

      INTEGER Autonomous
      COMMON /INTGDATA/ Autonomous
      REAL*8 STEPSTART
      COMMON /GDATA/ STEPSTART

C INLINED global variable declarations                             

