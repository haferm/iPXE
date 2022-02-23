# ipxe boot environement for Bios and UEFI

Dockerimage for ipxe for uefi and bios pxe boot

### Installation via command line
Install the docker container via command line:

```bash
docker pull haferm/ipxe
docker run --name ipxe -p 69:69 -v tftpboot:tftpboot haferm/ipxe
```

### Installation via docker compose
Install the docker container via docker compose:

```bash
version: "2.1"
services:
  ipxe:
    image: haferm/ipxe
    container_name: ipxe
    ports:
      - 69:69/udp
    volumes:
      - ./tftpboot:/tftpboot

    restart: unless-stopped
