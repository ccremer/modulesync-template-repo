# modulesync-template-repo
ModuleSync master template repo


execute with
```bash
docker run --rm -it -u $(id -u) --env SSH_AUTH_SOCK=/tmp/ssh_agent.sock --volume "${SSH_AUTH_SOCK}:/tmp/ssh_agent.sock" -v ${PWD}:/app vshn/modulesync msync update --noop --offline
```
