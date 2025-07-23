# -----------------------------------------------
# Build OpenMPI 5.0.8 with default CUDA support.
# -----------------------------------------------

INSTALL_DIR=$HOME/opt/openmpi-5.0.8

echo Install to $INSTALL_DIR
set -x

curl -o openmpi-5.0.8.tar.bz2 https://download.open-mpi.org/release/open-mpi/v5.0/openmpi-5.0.8.tar.bz2
tar -xf openmpi-5.0.8.tar.bz2

cd openmpi-5.0.8
./configure --prefix=$INSTALL_DIR --enable-mpirun-prefix-by-default --disable-mpi-fortran \
  --with-cuda 
# --with-cuda=$CUDA_HOME
make -j
make install
