#!/bin/bash

# Setup SQuIDS
export HOMEDECAY=/home/oalterkait/ubdecay/buildSQuIDS/
cd SQuIDS/
./configure --prefix=$HOMEDECAY
make uninstall
make
export PKG_CONFIG_PATH="${HOMEDECAY}lib/pkgconfig:$PKG_CONFIG_PATH"
make install

# Setup nuSQuIDS
cd ../nuSQuIDS/

./configure --prefix=/home/oalterkait/ubdecay/buildnuSQuIDS/ --with-squids-incdir=/home/oalterkait/ubdecay/buildSQuIDS/include/ --with-squids-libdir=/home/oalterkait/ubdecay/buildSQuIDS/lib/ --with-hdf5=/home/oalterkait/ubdecay/hdf5/HDF5-1.12.2-Linux/HDF_Group/HDF5/1.12.2/

make uninstall
make
make install

export LD_LIBRARY_PATH=/home/oalterkait/ubdecay/buildnuSQuIDS/lib:/home/oalterkait/ubdecay/buildSQuIDS/lib:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=/home/oalterkait/ubdecay/buildnuSQuIDS/lib/pkgconfig:/home/oalterkait/ubdecay/buildSQuIDS/lib/pkgconfig:$PKG_CONFIG_PATH

export PKG_CONFIG_PATH=/home/oalterkait/ubdecay/hdf5/HDF5-1.12.2-Linux/HDF_Group/HDF5/1.12.2/lib/pkgconfig:$PKG_CONFIG_PATH
export LD_LIBRARY_PATH=/home/oalterkait/ubdecay/hdf5/HDF5-1.12.2-Linux/HDF_Group/HDF5/1.12.2/lib:$LD_LIBRARY_PATH

export NUSQUIDS_DATA_PATH=/home/oalterkait/ubdecay/buildnuSQuIDS/share/nuSQuIDS
export LD_LIBRARY_PATH=/home/oalterkait/ubdecay/buildnuSQuIDS/lib:/home/oalterkait/ubdecay/buildSQuIDS/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/home/oalterkait/ubdecay/hdf5/HDF5-1.12.2-Linux/HDF_Group/HDF5/1.12.2/lib:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=/home/oalterkait/ubdecay/buildnuSQuIDS/lib/pkgconfig:/home/oalterkait/ubdecay/buildSQuIDS/lib/pkgconfig:$PKG_CONFIG_PATH
export NUSQUIDS_DATA_PATH=/home/oalterkait/ubdecay/buildnuSQuIDS/share/nuSQuIDS


# Setup nuSQUIDSDecay
cd ../nuSQUIDSDecay/
make clean
make
