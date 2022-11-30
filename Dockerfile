# https://docs.docker.com/engine/reference/builder/#from
# This container is meant to be for interactive exploration, so use Ubuntu
# instead of Alpine, because it has more familiar tools included.
FROM ubuntu:22.10
WORKDIR /root
RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y fish
RUN apt-get install -y git

# Install Neovim
# We install from source instead of using apt-get, because I found that the
# apt-get M1 version doesn't work well with Packer
# (https://github.com/nvim-telescope/telescope.nvim/issues/2158#issuecomment-1237716752).
RUN apt-get install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
RUN git clone --depth=1 --branch=release-0.8 https://github.com/neovim/neovim
WORKDIR neovim
RUN make CMAKE_BUILD_TYPE=Release
RUN make install
WORKDIR ..

RUN mkdir -p .config/nvim/lua
WORKDIR .config/nvim
COPY config/init.lua .
COPY config/lua/utils.lua lua/
WORKDIR ../..
