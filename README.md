# CentOS 7.9 Docker Environment

This project provides a Docker environment for running CentOS 7.9 with SSH access and volume mounting capabilities.

## Features

- CentOS 7.9.2009 base image
- Configured SSH server with root access
- Port forwarding for SSH (22) and HTTP (80)
- Volume mounting for data persistence
- Timezone configuration (Asia/Seoul)
- Docker Compose setup for easy deployment

## Prerequisites

- Docker
- Docker Compose

## Project Structure

```
.
├── Dockerfile
├── docker-compose.yml
├── README.md
└── data/            # Shared volume directory
```

## Configuration Details

### Dockerfile

The Dockerfile sets up a CentOS 7.9 environment with the following configurations:

- Updates mirror servers to vault.centos.org
- Installs and configures OpenSSH server
- Enables root login with password authentication
- Creates a startup script for SSH daemon
- Exposes ports 22 (SSH) and 80 (HTTP)

### Docker Compose

The docker-compose.yml file configures the service with:

- Port mappings:
  - SSH: Host port 2222 → Container port 22
  - HTTP: Host port 8080 → Container port 80
- Volume mounting: ./data → /data
- Timezone setting: Asia/Seoul
- Network configuration: Bridge networking

## Usage

1. Clone this repository:
   ```bash
   git clone <repository-url>
   cd <repository-directory>
   ```

2. Build and start the container:
   ```bash
   docker-compose up -d
   ```

3. Connect via SSH:
   ```bash
   ssh root@localhost -p 2222
   ```
   Default credentials:
   - Username: root
   - Password: password

4. Stop the container:
   ```bash
   docker-compose down
   ```

## Data Persistence

The `./data` directory on your host system is mounted to `/data` in the container. Any files placed in this directory will persist across container restarts.

## Security Considerations

⚠️ **Warning**: This configuration includes:
- Root login enabled
- Password authentication
- Default password

This setup is intended for development/testing purposes. For production use:
- Disable root login
- Use key-based authentication
- Change default passwords
- Implement proper firewall rules
