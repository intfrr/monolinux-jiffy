export ML_ROOT=$(readlink -f 3pp/monolinux)
export ML_SOURCES=$(readlink -f 3pp)
export ML_LINUX_CONFIG=$(readlink -f app/linux-4.14.78-jiffy.config)
export PATH=$PATH:$ML_ROOT/bin
export PATH=$PATH:$(readlink -f arm-linux-musleabi-cross/bin)
export ARCH=arm
export CROSS_COMPILE=arm-linux-musleabi-
export ML_AUTOTOOLS_HOST=arm-linux-musleabi
