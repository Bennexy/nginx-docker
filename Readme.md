# Nginx-docker

```
docker run -d -p 80:80 -p 443:443 --name nginx -it -v <local/folder to default.conf>:/etc/nginx/sites-enabled bennexy/nginx-docker:latest
```

1. Port forward all trafik to the docker
2. Test is dns resolution works (if you can reach the server via http:// )
3. Issue https -> `certbot --nginx -d example.com` 

[docker-hub](https://hub.docker.com/r/bennexy/nginx-docker)

### default.conf example
```

server {
    listen  80;
    listen  [::]:80;

    server_name    smt.smt.de;

    location / {
	proxy_pass    http://192.168.50.33:8080;
	# these are additional configs - not required but nice to have
	proxy_redirect     off;
        proxy_set_header   Host $host;
        proxy_set_header   X-Real-IP $remote_addr;
        proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header   X-Forwarded-Host $server_name;				

    }
} 

```



