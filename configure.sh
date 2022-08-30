#!/bin/bash

HOMEDECAY=$PWD

export PKG_CONFIG_PATH="${HOMEDECAY}/hdf5/HDF5-1.12.2-Linux/HDF_Group/HDF5/1.12.2/lib/pkgconfig:$PKG_CONFIG_PATH"
export NUSQUIDS_DATA_PATH="${HOMEDECAY}/buildnuSQuIDS/share/nuSQuIDS"
export LD_LIBRARY_PATH="${HOMEDECAY}/buildnuSQuIDS/lib:${HOMEDECAY}/buildSQuIDS/lib:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="${HOMEDECAY}/hdf5/HDF5-1.12.2-Linux/HDF_Group/HDF5/1.12.2/lib:$LD_LIBRARY_PATH"
export PKG_CONFIG_PATH="${HOMEDECAY}/buildnuSQuIDS/lib/pkgconfig:${HOMEDECAY}/buildSQuIDS/lib/pkgconfig:$PKG_CONFIG_PATH"
export NUSQUIDS_DATA_PATH="${HOMEDECAY}/buildnuSQuIDS/share/nuSQuIDS"
