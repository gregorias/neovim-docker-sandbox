# Neovim Docker Sandbox

This repository is a Docker container recipe for a basic Neovim sandbox. I
created this container to facilitate experimenting with Neovim configs.

## Build & Run

To build and run this container, execute the following
snippet.

```shell
docker build -t neovim-docker-sandbox .
docker run -it neovim-docker-sandbox:latest fish
```
