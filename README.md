# ubdecay

Repository for MicroBooNE 3+1+Decay Analysis

Taken from the nuSQYUDSDecay Repository (https://https://github.com/arguelles/nuSQUIDSDecay)


## Setup

### Inititiate Submodules 

```
git submodule init
git submodule update
```

### Setup HDf5

Download `CMake-hdf5-1.12.2.tar.gz` from <https://www.hdfgroup.org/downloads/hdf5/>. (also available on Mayer:/home/oalterkait/ubdecay)

```bash
tar -xvf CMake-hdf5-1.12.2.tar.gz
cd CMake-hdf5-1.12.2
source build-unix.sh # Takes a bit
cp HDF5-1.12.2-Linux.tar.gz ../hdf5/
cd ../hdf5/
tar -xvf HDF5-1.12.2-Linux.tar.gz
```

### Run configure file to set everything up (rerun to build again)

```bash
source build.sh
```

To build and test do 
```bash
source buildtest.sh
```

### Get input flux
Run `extract_MicroBooNE_flux.py` to get fluxes (input and outputs files can also be found at Mayer:/home/oalterkait/ubdecay).

Copy the input flux .dat file to `nuSQUIDSDecay/fluxes/`. They are formatted via CosTheta / Enu / NuFlux / Anti-NuFlux
nRows = nCosth x nEnu. 

### On startup run

```bash
source configure.sh
```

### Evolve fluxes

Go to `nuSQUIDSDecay/examples` and run `./uBFlux_example`.
