# ipxe

Dockerimage for ipxe for uefi and bios pxe boot

### Installation via command line
Install the docker container via command line:

```bash
docker pull haferm/ipxe
docker run --name iperf3 -p 5201:5201 -v haferm/ipxe
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
      - 66:66
    volumes:
      - ./tftp:/srv/tftp
      - ./config:/etc/default/
      
    restart: unless-stopped
