#!/bin/bash
gfortran-6 test_NetCDF_IO.F90 -o test_NetCDF_IO.exe -I$NETCDF_HOME/include -L$NETCDF_HOME/lib -lnetcdff
