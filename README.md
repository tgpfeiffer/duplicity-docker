# duplicity in Docker

This Docker image can be used to perform backups using [duplicity](http://duplicity.nongnu.org/) **without encryption**. This might be useful if you want to perform backups to a trusted location but still get the incremental backups in tar format.

To back up `/data` to `/backup`, use the following command:

```
docker run --rm --net=host \
  -v /duplicity-cache:/root/.cache/duplicity \
  -v /data:/source:ro \
  -v /backup:/target \
  tgpfeiffer/duplicity \
  duplicity --no-encryption /source file:///target
```

Note: It is necessary to use `--net=host` (or fix the `--hostname` of the container) to avoid the "Fatal Error: Backup source host has changed" error from duplicity.
