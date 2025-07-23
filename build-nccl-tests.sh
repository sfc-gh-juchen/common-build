MPI_HOME=$HOME/opt/openmpi 
NCCL_HOME=$HOME/opt/nccl

git clone https://github.com/NVIDIA/nccl-tests.git
cd nccl-tests
make -j MPI=1 MPI_HOME=$MPI_HOME NCCL_HOME=$NCCL_HOME
