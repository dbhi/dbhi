#!/usr/bin/env sh

# Tested on
# Pynq SD Images: v2.3, v2.4 and v2.5
# Boards: PYNQ-Z1, ARTY-Z7

$(command -v sudo) apt update -qq

# Install GHDL dependencies
$(command -v sudo) apt-get -y install --no-install-recommends \
  ca-certificates \
  clang-6.0 \
  gcc \
  git \
  gnat-8 \
  libstdc++-8-dev \
  llvm-6.0-dev \
  make \
  zlib1g-dev

git clone --recurse-submodules https://github.com/dbhi/dbhi
cd dbhi

# Build GHDL with `--default_pic` and install it at `/opt/ghdl`
git clone https://github.com/ghdl/ghdl
cd ghdl
mkdir build-llvm
cd build-llvm
CXX=clang++-6.0 ../configure --with-llvm-config=llvm-config-6.0 --default-pic --disable-werror
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
