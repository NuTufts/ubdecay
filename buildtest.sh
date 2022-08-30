#!/bin/bash

# Setup SQuIDS
HOMEDECAY=$PWD
export HOMESQ="${HOMEDECAY}/buildSQuIDS/"
cd SQuIDS/
./configure --prefix=$HOMESQ
make uninstall
make
make test
export PKG_CONFIG_PATH="${HOMESQ}lib/pkgconfig:$PKG_CONFIG_PATH"
make install

# Setup nuSQuIDS
cd ../nuSQuIDS/

export HOMENUS="${HOMEDECAY}/buildnuSQuIDS/"
export SQUIDSINC="${HOMEDECAY}/buildSQuIDS/include/"
export SQUIDSLIB="${HOMEDECAY}/buildSQuIDS/lib/"
export HDF5LOC="${HOMEDECAY}/hdf5/HDF5-1.12.2-Linux/HDF_Group/HDF5/1.12.2/"


./configure --prefix=$HOMENUS --with-squids-incdir=$SQUIDSINC --with-squids-libdir=$SQUIDSLIB --with-hdf5=$HDF5LOC


make uninstall
make
make install
make test

export PKG_CONFIG_PATH="${HOMEDECAY}/hdf5/HDF5-1.12.2-Linux/HDF_Group/HDF5/1.12.2/lib/pkgconfig:$PKG_CONFIG_PATH"
export NUSQUIDS_DATA_PATH="${HOMEDECAY}/buildnuSQuIDS/share/nuSQuIDS"
export LD_LIBRARY_PATH="${HOMEDECAY}/buildnuSQuIDS/lib:${HOMEDECAY}/buildSQuIDS/lib:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="${HOMEDECAY}/hdf5/HDF5-1.12.2-Linux/HDF_Group/HDF5/1.12.2/lib:$LD_LIBRARY_PATH"
export PKG_CONFIG_PATH="${HOMEDECAY}/buildnuSQuIDS/lib/pkgconfig:${HOMEDECAY}/buildSQuIDS/lib/pkgconfig:$PKG_CONFIG_PATH"
export NUSQUIDS_DATA_PATH="${HOMEDECAY}/buildnuSQuIDS/share/nuSQuIDS"

# Setup nuSQUIDSDECAY
cd ../nuSQUIDSDecay/
make clean
make
