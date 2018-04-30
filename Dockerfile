FROM nginx:mainline

RUN apt-get update

RUN apt-get install -y wget apt-transport-https
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN sh -c 'echo "deb http://packages.sury.org/php/ stretch main" > /etc/apt/sources.list.d/php.list'

RUN apt-get update

RUN apt-get install -y php7.2-fpm
RUN apt-get install -y php7.2-cli
RUN apt-get install -y php7.2-mbstring
RUN apt-get install -y php7.2-xml
RUN apt-get install -y php7.2-ctype
RUN apt-get install -y php7.2-json
RUN apt-get install -y php7.2-opcache

RUN php -r "copy('https://getcomposer.org/installer', '/tmp/composer-setup.php');"
RUN php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=compose

RUN mkdir -p /run/php

ADD nginx.conf /etc/nginx/nginx.conf
ADD test.html /var/www/public/index.php

CMD php-fpm7.2 && nginx -g "daemon off;"

EXPOSE 80
