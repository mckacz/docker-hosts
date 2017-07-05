# docker-hosts

Extreemly simple app that automatically adds running Docker containers to `/etc/hosts`. 

Features:
 * automatically adds host entry based on container name (eg. `foo.docker` for container `foo`)
 * adds hosts entries based on container label `hosts` (example below)
 * works in background - start once and forget (when you launch new container, hosts file will be updated immediatelly) 
 * simple install, no dependecies - running in Docker container

### Start container

```bash
docker run \
    -d --restart always --name docker-hosts \
    -v /var/run/docker.sock:/tmp/docker.sock:ro \
    -v /etc/hosts:/etc/hosts:rw \
    mckacz/docker-hosts
```

### Custom hosts

To specify custom host entries for specified container, just define label `hosts` with host names 
delimited with space.    

**Example** - nginx container that will be available on domains `nginx_example.dev` and `foo.dev`.

```bash
docker run --rm -l "hosts=nginx_example.dev foo.dev" nginx:alpine
```
