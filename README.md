# Neovim Docker Sandbox

This repository is a Docker container recipe for a basic Neovim sandbox. I
created this container to facilitate experimenting with Neovim configs.

## Build & Run

To build and run this container, execute the following snippet.

1. Build the initial image.

  ```shell
  docker build -t neovim-docker-sandbox .
  ```

2. Run the image:

  ```shell
  docker run -it neovim-docker-sandbox:latest fish
  ```

3. Bootstrap Neovim's plugins:

  ```shell
  nvim # and run :PackerSync
  ```

4. Update the image in a separate terminal:

  ```shell
  docker ps # Check the container ID.
  docker commit CONTAINER_ID neovim-docker-sandbox
  ```
