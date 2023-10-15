# https://docs.docker.com/engine/reference/builder/#from
# This container is meant to be for interactive exploration, so use Ubuntu
# instead of Alpine, because it has more familiar tools included.
FROM ubuntu:23.10
WORKDIR /root
RUN apt-get update
# Install useful utilities
RUN apt-get install -y curl
RUN apt-get install -y fish
RUN apt-get install -y git
RUN apt-get install -y aptitude
RUN apt-get install -y pip
RUN apt-get install -y python3-venv python3-neovim
# Necessary for GHCup
RUN apt-get install -y build-essential libffi-dev libffi8ubuntu1 libgmp-dev libgmp10 libnuma-dev libncurses-dev libncurses6 libtinfo6

# Install Neovim
# We install from source instead of using apt-get, because I found that the
# apt-get M1 version doesn't work well with Packer
# (https://github.com/nvim-telescope/telescope.nvim/issues/2158#issuecomment-1237716752).
RUN apt-get install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
RUN git clone --depth=1 --branch=v0.9.4 https://github.com/neovim/neovim
WORKDIR neovim
RUN make CMAKE_BUILD_TYPE=Release
RUN make install
WORKDIR ..
