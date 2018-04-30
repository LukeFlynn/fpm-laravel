# A Dockerfile for hosting Laravel Applications

### Usage:

```
FROM lukehflynn/fpm-laravel:latest

ENV app_home /var/www

ADD . ${app_home}

WORKDIR ${app_name}

RUN composer install

EXPOSE 80
```
