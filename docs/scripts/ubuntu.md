# Ubuntu Scripts

This section covers scripts specific to Ubuntu environments.

## docker-setup.sh

The `docker-setup.sh` script automates the installation of Docker on Ubuntu and WSL2.

### Usage

```bash
./scripts/ubuntu/docker-setup.sh
```

### What It Does

1. Updates package lists
2. Installs curl if not present
3. Adds Docker repository to APT sources
4. Installs Docker and Docker Compose
5. Adds the current user to the docker group
6. Starts the Docker service

### Reference

This script is based on documentation from:
- [Docker's official installation guide](https://docs.docker.com/engine/install/ubuntu/)
- [Docker on WSL2](https://dev.to/0xkoji/install-docker-on-wsl2-2ma5)
