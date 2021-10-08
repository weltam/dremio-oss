wget https://github.com/llvm/llvm-project/archive/refs/tags/llvmorg-12.0.1.tar.gz
tar -xvf llvmorg-12.0.1.tar.gz
cd llvm-project-llvmorg-12.0.1
mkdir build && cd build

cmake .. -G Ninja -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra;lldb;" \
                    -DCMAKE_BUILD_TYPE=Release \
                    -DLLVM_TARGETS_TO_BUILD="ARM;AArch64" ../llvm

ninja 
sudo ninja install