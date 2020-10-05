<h1 align=center>Dockette / Drupalista</h1>

<p align=center>
   🐳 Dockerized Drupal Stack
</p>

<p align=center>
🕹 <a href="https://f3l1x.io">f3l1x.io</a> | 💻 <a href="https://github.com/f3l1x">f3l1x</a> | 🐦 <a href="https://twitter.com/xf3l1x">@xf3l1x</a>
</p>

-----

## Usage

This stack is composed from:

- `drupalista/web`
  - Based on `thecodingmachine/php:7.4-v3-slim-apache`
  - PHP: amqp, apcu, ast, bcmath, blackfire, bz2, calendar, Core, ctype, curl, date, dba, dom, ds, enchant, ev, event, exif, fileinfo, filter, ftp, gd, gettext, gmp, gnupg, hash, iconv, igbinary, imagick, imap, intl, json, ldap, libxml, mailparse, mbstring, memcached, mongodb, msgpack, mysqli, mysqlnd, openssl, pcntl, pcov, pcre, PDO, pdo_dblib, pdo_mysql, pdo_pgsql, pdo_sqlite, pgsql, Phar, posix, pspell, rdkafka, readline, redis, Reflection, session, shmop, SimpleXML, soap, sockets, sodium, SPL, sqlite3, standard, swoole, sysvmsg, sysvsem, sysvshm, tidy, tokenizer, uploadprogress, uuid, xdebug, xml, xmlreader, xmlrpc, xmlwriter, xsl, yaml, Zend OPcache, zip, zlib, Xdebug, Zend OPcache, blackfire
  - Workdir `/srv`
- `drupalista/redis`
  - Based on `redis:5`
  - Update using unix socket

```yaml
version: '3.6'

services:
  web:
    image: drupalista/web
    restart: unless-stopped
    ports:
      - 8000:80
    environment:
      - STARTUP_COMMAND_1=composer install
    volumes:
      - ./:/srv:cached
      - ./.data/redis:/tmp/docker:cached

  postgresql:
    image: postgres:12
    restart: unless-stopped
    ports:
      - 5432:5432
    environment:
      - POSTGRES_PASSWORD=drupal
      - POSTGRES_USER=drupal
      - POSTGRES_DB=drupal
    volumes:
      - ./.data/postgres:/var/lib/postgresql/data

  adminer:
    image: dockette/adminer:dg
    restart: unless-stopped
    ports:
      - 8010:80

  redis:
    image: drupalista/redis
    restart: unless-stopped
    ports:
      - 6379:6379
    volumes:
      - ./.data/redis:/tmp/docker:cached
```

## Development

See [how to contribute](https://contributte.org/contributing.html) to this package.

This package is currently maintaining by these authors.

<a href="https://github.com/f3l1x">
    <img width="80" height="80" src="https://avatars2.githubusercontent.com/u/538058?v=3&s=80">
</a>

-----

Consider to [support](https://contributte.org/partners.html) **dockette** development team.
Also thank you for using this package.
