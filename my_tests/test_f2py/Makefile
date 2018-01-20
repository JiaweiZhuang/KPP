#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# User: Set here the F90 compiler and options
#       Pedefined compilers: INTEL, PGF, HPUX, LAHEY
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#COMPILER = G95
#COMPILER = LAHEY
#COMPILER = INTEL
#COMPILER = PGF
#COMPILER = HPUX
COMPILER = GFORTRAN

FC_G95     = g95
FOPT_G95   = -cpp -O -pg -fbounds-check -fimplicit-none  -Wall -ftrace=full

FC_LAHEY   = lf95
# More aggressive for production runs:
#FOPT_LAHEY = -Cpp --pca -O
# More checking for debugging:
FOPT_LAHEY = -Cpp --chk a,e,s,u --pca --ap -O0 -g --trap --trace --chkglobal

FC_INTEL   = ifort 
# More aggressive for production runs:
#FOPT_INTEL = -cpp -O -fp-model precise -pc80 -prec_div
# More checking for debugging:
FOPT_INTEL = -cpp -O0 -fp-model strict -implicitnone -ftrapuv \
              -debug all -check all -warn all

FC_PGF     = pgf90
# More aggressive for production runs:
FOPT_PGF   = -Mpreprocess -O -fast -pc 80 -Kieee
# More checking for debugging:
#FOPT_PGF   = -Mpreprocess -O0 -Mbounds -Mchkfpstk -Mchkptr -Mchkstk \
#             -Ktrap=fp -pc 80 -Kieee

FC_HPUX    = f90
FOPT_HPUX  = -O -u +Oall +check=on

FC_GFORTRAN     = gfortran
FOPT_GFORTRAN   = -cpp -O

# define FULL_ALGEBRA for non-sparse integration
FC   = $(FC_$(COMPILER))
FOPT = $(FOPT_$(COMPILER)) # -DFULL_ALGEBRA

LIBS =
#LIBS = -llapack -lblas

# Command to create Matlab mex gateway routines 
# Note: use $(FC) as the mex Fortran compiler
MEX  = mex

GENSRC = ros_Precision.f90  \
	 ros_Parameters.f90     \
	 ros_Global.f90  

GENOBJ = ros_Precision.o    \
	 ros_Parameters.o       \
	 ros_Global.o     

FUNSRC = ros_Function.f90 
FUNOBJ = ros_Function.o 

JACSRC = ros_JacobianSP.f90  ros_Jacobian.f90
JACOBJ = ros_JacobianSP.o    ros_Jacobian.o

HESSRC = ros_HessianSP.f90   ros_Hessian.f90
HESOBJ = ros_HessianSP.o     ros_Hessian.o

STMSRC = ros_StoichiomSP.f90 ros_Stoichiom.f90 
STMOBJ = ros_StoichiomSP.o   ros_Stoichiom.o

UTLSRC = ros_Rates.f90 ros_Util.f90 ros_Monitor.f90
UTLOBJ = ros_Rates.o   ros_Util.o   ros_Monitor.o

LASRC  = ros_LinearAlgebra.f90 
LAOBJ  = ros_LinearAlgebra.o   

STOCHSRC = ros_Stochastic.f90 
STOCHOBJ = ros_Stochastic.o 

MAINSRC = ros_Main.f90   ros_Initialize.f90   ros_Integrator.f90 ros_Model.f90
MAINOBJ = ros_Main.o     ros_Initialize.o     ros_Integrator.o   ros_Model.o 

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# User: modify the line below to include only the
#       objects needed by your application
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ALLOBJ = $(GENOBJ) $(FUNOBJ) $(JACOBJ) $(HESOBJ) $(STMOBJ) \
	 $(UTLOBJ) $(LAOBJ)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# User: modify the line below to include only the
#       executables needed by your application
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
all:    exe

exe:	$(ALLOBJ) $(MAINOBJ) 
	$(FC) $(FOPT) $(ALLOBJ) $(MAINOBJ) $(LIBS) -o ros.exe

stochastic:$(ALLOBJ) $(STOCHOBJ) $(MAINOBJ)
	$(FC) $(FOPT) $(ALLOBJ) $(STOCHOBJ) $(MAINOBJ) $(LIBS) \
	-o ros_stochastic.exe

mex:    $(ALLOBJ)
	$(MEX) FC#$(FC) -fortran -O ros_mex_Fun.f90     $(ALLOBJ)
	$(MEX) FC#$(FC) -fortran -O ros_mex_Jac_SP.f90  $(ALLOBJ)
	$(MEX) FC#$(FC) -fortran -O ros_mex_Hessian.f90 $(ALLOBJ)

clean:
	rm -f ros*.o ros*.mod \
	ros*.dat ros.exe ros*.mexglx \
	ros.map

distclean:
	rm -f ros*.o ros*.mod \
	ros*.dat ros.exe ros.map \
	ros*.f90 ros_*.mexglx

ros_Precision.o: ros_Precision.f90 
	$(FC) $(FOPT) -c $<

ros_Parameters.o: ros_Parameters.f90 \
	            ros_Precision.o
	$(FC) $(FOPT) -c $<

ros_Monitor.o: ros_Monitor.f90 \
	             ros_Precision.o
	$(FC) $(FOPT) -c $<

ros_Global.o: ros_Global.f90 \
	            ros_Parameters.o ros_Precision.o
	$(FC) $(FOPT) -c $<

ros_Initialize.o: ros_Initialize.f90  $(GENOBJ) 
	$(FC) $(FOPT) -c $<

ros_Function.o: ros_Function.f90  $(GENOBJ) 
	$(FC) $(FOPT) -c $<

ros_Stochastic.o: ros_Stochastic.f90  $(GENOBJ) 
	$(FC) $(FOPT) -c $<

ros_JacobianSP.o: ros_JacobianSP.f90 $(GENOBJ)
	$(FC) $(FOPT) -c $<

ros_Jacobian.o: ros_Jacobian.f90  $(GENOBJ) ros_JacobianSP.o
	$(FC) $(FOPT) -c $<

ros_LinearAlgebra.o: ros_LinearAlgebra.f90 $(GENOBJ) ros_JacobianSP.o
	$(FC) $(FOPT) -c $<

ros_Rates.o: ros_Rates.f90  $(GENOBJ) 
	$(FC) $(FOPT) -c $<

ros_HessianSP.o: ros_HessianSP.f90  $(GENOBJ)
	$(FC) $(FOPT) -c $<

ros_Hessian.o:  ros_Hessian.f90 $(GENOBJ) ros_HessianSP.o
	$(FC) $(FOPT) -c $<

ros_StoichiomSP.o: ros_StoichiomSP.f90 $(GENOBJ)
	$(FC) $(FOPT) -c $<

ros_Stoichiom.o: ros_Stoichiom.f90  $(GENOBJ) ros_StoichiomSP.o
	$(FC) $(FOPT) -c $<

ros_Util.o: ros_Util.f90  $(GENOBJ) ros_Monitor.o
	$(FC) $(FOPT) -c $<

ros_Main.o: ros_Main.f90  $(ALLOBJ) ros_Initialize.o ros_Model.o ros_Integrator.o
	$(FC) $(FOPT) -c $<

ros_Model.o: ros_Model.f90  $(ALLOBJ) ros_Integrator.o
	$(FC) $(FOPT) -c $<

ros_Integrator.o: ros_Integrator.f90  $(ALLOBJ)
	$(FC) $(FOPT) -c $<
