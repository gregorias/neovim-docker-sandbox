# Neovim Docker Sandbox

This repository is a Docker container recipe for a basic Neovim sandbox. I
created this container to facilitate experimenting with Neovim configs.

## Build & Run

To build and run this container, execute the following snippet.

1. Build the initial image.
    ```shell
    docker build -t neovim-docker-sandbox .
    ```
1. Run the image:
    ```shell
    docker run -v $(pwd)/config:/root/.config/nvim \
               -it neovim-docker-sandbox:latest fish
    ```
1. Bootstrap Neovim's plugins:
    ```shell
    nvim
    ```
1. Update the image in a separate terminal:
    ```shell
    docker ps # Check the container ID.
    docker commit CONTAINER_ID neovim-docker-sandbox
    ```
