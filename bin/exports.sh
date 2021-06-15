# for deb making, used in dh_make
export DEBMAIL="kparichay@gmail.com"
export DEBFULLNAME="Parichay Kapoor"

# bazel for tensorflow
export PATH="$PATH:$HOME/bin"

# cuda/cudnn
export CUDA_HOME="/usr/local/cuda/"
export PATH="$PATH:/usr/local/cuda/bin"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"/usr/local/cuda/lib64"
