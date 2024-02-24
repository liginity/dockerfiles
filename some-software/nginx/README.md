## get the default site configuration for nginx

``` bash
docker run --rm --entrypoint=cat nginx /etc/nginx/conf.d/default.conf > default.conf
```
