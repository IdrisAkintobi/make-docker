# Docker Services Collection

This repository (`make-docker`) is a collection of Docker configurations for various services, each residing in its own subdirectory. The goal is to provide a centralized and easy-to-manage way to run different services using Docker.

## Getting Started

The project includes a root `Makefile` that acts as a central command-line interface (CLI) for managing all services.

### Prerequisites

- **Docker:** Ensure Docker is installed and running on your system.
- **Make:** The `make` utility is required to use the root Makefile.

### Docker Credential Store (Important for CLI usage)

This setup is designed to be used with the Docker CLI. If you are using Docker Desktop, you might encounter issues with credential storage. To ensure smooth operation, please check your Docker configuration:

1.  Open the Docker configuration file: `~/.docker/config.json`
2.  If you find the line `"credsStore": "desktop",`, delete it.
3.  After modifying the file, run the following commands in your terminal:
    ```bash
    docker logout
    docker login
    ```
    This will reconfigure Docker to use the standard credential helper, which is compatible with CLI operations.

### Environment Variables (`.env` files)

Some services, such as `docker-mongo`, require specific environment variables to be set. These are typically managed via `.env` files located within the respective service directories. Please refer to each service's directory for details on required `.env` files and their contents.

## Usage

Navigate to the root directory of this repository in your terminal. You can use the following `make` commands:

- **`make help`**: Displays a list of all available commands and their descriptions.

- **`make start`**: Interactively select one or more services to start.

  - **Note:** This command will automatically attempt to `build` any selected service that contains a `Dockerfile` before starting it.

- **`make stop`**: Interactively select one or more services to stop.

- **`make clean`**: Interactively select one or more services to clean (stop and remove containers/volumes).

- **`make build`**: Interactively select one or more services to build.

  - **Note:** This command will only attempt to build services that contain a `Dockerfile` in their respective directories. Services without a `Dockerfile` will be skipped.

- **`make build-all`**: Builds all services in the repository.

  - **Note:** Similar to `make build`, this command will only build services that contain a `Dockerfile`. Services without a `Dockerfile` will be skipped.

- **`make ps`**: Shows the status of all services (running, stopped, etc.).

- **`make logs`**: Interactively select one or more services to view their Docker logs.

## Adding New Services

To add a new service to this collection:

1.  Create a new directory for your service (e.g., `docker-my-service`).
2.  Inside this directory, create a `Makefile` with at least `start`, `stop`, `clean`, `ps`, and `logs` targets. If your service uses Docker images that need to be built, include a `build` target.
3.  The root `Makefile` will automatically discover your new service.

Remember to use `$(CURDIR)` instead of `$(PWD)` in your service-specific Makefiles when referencing files relative to that service's directory, especially for volume mounts.
