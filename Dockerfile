FROM php:5.6-apache
MAINTAINER Steven Williams <steven@zilleem.com>
RUN a2enmod rewrite

run apt-get update
RUN apt-get install -y \
	vim \
	nano \
	ruby \
	ruby-full \
	git \
	net-tools \
	nodejs \
	npm \
	curl

RUN gem update system 
RUN gem install compass
RUN npm install -g bower grunt-cli

# install the PHP extensions we need (git for Composer, mysql-client for mysqldump)
RUN apt-get update && apt-get install -y libpng12-dev libjpeg-dev libpq-dev git mysql-client-5.5 wget \
	&& rm -rf /var/lib/apt/lists/* \
	&& docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
	&& docker-php-ext-install gd mbstring opcache pdo pdo_mysql pdo_pgsql zip

# set recommended PHP.ini settings
# see https://secure.php.net/manual/en/opcache.installation.php
RUN { \
		echo 'opcache.memory_consumption=128'; \
		echo 'opcache.interned_strings_buffer=8'; \
		echo 'opcache.max_accelerated_files=4000'; \
		echo 'opcache.revalidate_freq=60'; \
		echo 'opcache.fast_shutdown=1'; \
		echo 'opcache.enable_cli=1'; \
	} > /usr/local/etc/php/conf.d/opcache-recommended.ini

WORKDIR /root

#Configure PHP memory limit
RUN {  \
		echo "memory_limit = 256M"; \
	} >> /usr/local/etc/php/php.ini

# Update the default apache site with the config we created.
ADD apache-config.conf /etc/apache2/sites-enabled/000-default.conf

#Install Drush 8.1.2
RUN wget https://github.com/drush-ops/drush/releases/download/8.1.2/drush.phar && php drush.phar core-status && chmod +x drush.phar \
	&& mv drush.phar /usr/local/bin/drush

#Install Drupal Console
RUN curl http://drupalconsole.com/installer -L -o drupal.phar
RUN mv drupal.phar /usr/local/bin/drupal && chmod +x /usr/local/bin/drupal
RUN drupal init


WORKDIR /var/www/html
