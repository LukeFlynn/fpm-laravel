# A Dockerfile for hosting Laravel Applications

### Usage:

```Dockerfile
FROM lukehflynn/fpm-laravel:latest

ENV app_home /var/www

ADD . ${app_home}

WORKDIR ${app_home}

RUN composer install

EXPOSE 80
```
