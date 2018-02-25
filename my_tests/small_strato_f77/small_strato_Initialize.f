C ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
C                                                                  
C Initialization File                                              
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
C File                 : small_strato_Initialize.f                 
C Time                 : Sat Feb 24 03:01:25 2018                  
C Working directory    : /home/zhuangjw/KPP/my_tests/small_strato_f77
C Equation file        : small_strato.kpp                          
C Output root filename : small_strato                              
C                                                                  
C ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



C ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
C                                                                  
C Initialize - function to initialize concentrations               
C   Arguments :                                                    
C                                                                  
C ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

      SUBROUTINE Initialize ( )

      IMPLICIT NONE
      INCLUDE 'small_strato_Parameters.h'


      INCLUDE 'small_strato_Global.h'
      INTEGER i
      REAL*8 x

      CFACTOR = 1.000000d+00

      x = (0.)*CFACTOR
      DO i = 1, NVAR
        VAR(i) = x
      END DO

      x = (0.)*CFACTOR
      DO i = 1, NFIX
        FIX(i) = x
      END DO

      VAR(1) = (9.906E+01)*CFACTOR
      VAR(2) = (6.624E+08)*CFACTOR
      VAR(3) = (5.326E+11)*CFACTOR
      VAR(4) = (8.725E+08)*CFACTOR
      VAR(5) = (2.240E+08)*CFACTOR
      FIX(1) = (8.120E+16)*CFACTOR
      FIX(2) = (1.697E+16)*CFACTOR
C constant rate coefficients                                       
C END constant rate coefficients                                   

C INLINED initializations                                          

       	TSTART = (12*3600)
        TEND = TSTART + (3*24*3600)*10
        DT = 0.25*3600  
        TEMP = 270

        STEPMIN=0.0001
        STEPMAX=3600.
        Autonomous = 1 
        STEPSTART=STEPMIN

C End INLINED initializations                                      

      RETURN
      END

C End of Initialize function                                       
C ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
