#!/usr/bin/env sh

# Tested on
# Pynq SD Images: v2.3, v2.4 and v2.5
# Should work with v2.6 and v2.7 as well
# Boards: PYNQ-Z1, ARTY-Z7

$(command -v sudo) apt update -qq

GNAT_VER="${GNAT_VER:-8}"
LLVM_VER="${LLVM_VER:-6.0}"

# Install GHDL dependencies
$(command -v sudo) apt-get -y install --no-install-recommends \
  ca-certificates \
  clang-"$LLVM_VER" \
  gcc \
  git \
  gnat-"$GNAT_VER" \
  libstdc++-8-dev \
  llvm-"$LLVM_VER"-dev \
  make \
  zlib1g-dev

git clone --recurse-submodules https://github.com/dbhi/dbhi
cd dbhi

# Build GHDL with `--default_pic` and install it at `/opt/ghdl`
git clone https://github.com/ghdl/ghdl
cd ghdl
mkdir build-llvm
cd build-llvm
CXX=clang++-"$LLVM_VER" ../configure --with-llvm-config=llvm-config-"$LLVM_VER" --default-pic --disable-werror
make
if [ -d "/opt/ghdl" ]; then
  sudo rm -rf /opt/ghdl
  sudo mkdir -p /opt/ghdl
fi
make DESTDIR=/opt/ghdl install
cd ../..
rm -rf ghdl

# Install VUnit at `/opt/VUnit`
$(command -v sudo) git clone --recurse-submodules https://github.com/vunit/vunit /opt/vunit
pip3 install -r /opt/vunit/requirements.txt

# Install MAMBO dependencies
$(command -v sudo) apt -y install --no-install-recommends \
  libelf-dev \
  ruby

# Utils
$(command -v sudo) apt -y install --no-install-recommends \
  time

$(command -v sudo) apt autoclean
$(command -v sudo) apt clean
$(command -v sudo) apt -y autoremove
