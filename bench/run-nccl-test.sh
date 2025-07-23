
export NCCL_DEBUG=VERSION
export LD_LIBRARY_PATH=$NCCL_HOME/lib:$LD_LIBRARY_PATH

# NCCL 2.27.6 with Symm On
mpirun --bind-to core --map-by core --report-bindings -np 2 ./build/all_reduce_perf -R 2 -b 8 -e 4G -G 100 -f 2 -n 100 -w 25 -g 1 | tee data/nccl-b200x2.symm.log
mpirun --bind-to core --map-by core --report-bindings -np 4 ./build/all_reduce_perf -R 2 -b 8 -e 4G -G 100 -f 2 -n 100 -w 25 -g 1 | tee data/nccl-b200x4.symm.log
mpirun --bind-to core --map-by core --report-bindings -np 8 ./build/all_reduce_perf -R 2 -b 8 -e 4G -G 100 -f 2 -n 100 -w 25 -g 1 | tee data/nccl-b200x8.symm.log

# NCCL 2.27.6 with Symm Off
mpirun --bind-to core --map-by core --report-bindings -np 2 ./build/all_reduce_perf -R 1 -b 8 -e 4G -G 100 -f 2 -n 100 -w 25 -g 1 | tee data/nccl-b200x2.local.log
mpirun --bind-to core --map-by core --report-bindings -np 4 ./build/all_reduce_perf -R 1 -b 8 -e 4G -G 100 -f 2 -n 100 -w 25 -g 1 | tee data/nccl-b200x4.local.log
mpirun --bind-to core --map-by core --report-bindings -np 8 ./build/all_reduce_perf -R 1 -b 8 -e 4G -G 100 -f 2 -n 100 -w 25 -g 1 | tee data/nccl-b200x8.local.log
