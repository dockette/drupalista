<h1 align=center>Dockette / Drupalista</h1>

<p align=center>
   <a href="https://github.com/dockette/drupalista/actions"><img src="https://github.com/dockette/drupalista/actions/workflows/docker.yml/badge.svg" alt="GitHub Actions"></a>
   <a href="https://github.com/sponsors/f3l1x"><img src="https://img.shields.io/badge/sponsor-GitHub%20Sponsors-ea4aaa" alt="GitHub Sponsors"></a>
   <a href="https://github.com/orgs/dockette/discussions"><img src="https://img.shields.io/badge/support-discussions-6f42c1" alt="Support/Discussions"></a>
</p>

<p align=center>
    🐳 Dockerized Drupal Stack
</p>

<p align=center>
🕹 <a href="https://f3l1x.io">f3l1x.io</a> | 💻 <a href="https://github.com/f3l1x">f3l1x</a> | 🐦 <a href="https://twitter.com/xf3l1x">@xf3l1x</a>
</p>

-----

## Usage

This is a legacy Drupal stack. The baseline intentionally keeps PHP 7.4, Redis 5 and PostgreSQL 12 aligned with the original runtime instead of modernizing the application stack.

This stack is composed from these images:

- `drupalista/web`
  - Based on `thecodingmachine/php:7.4-v3-slim-apache`
  - PHP: apcu, ast, bcmath, blackfire, bz2, calendar, Core, ctype, curl, date, dba, dom, ds, enchant, ev, event, exif, fileinfo, filter, ftp, gd, gettext, gmp, gnupg, hash, iconv, igbinary, imagick, imap, intl, json, ldap, libxml, mailparse, mbstring, memcached, mongodb, msgpack, mysqli, mysqlnd, openssl, pcntl, pcov, pcre, PDO, pdo_dblib, pdo_mysql, pdo_pgsql, pdo_sqlite, pgsql, Phar, posix, pspell, rdkafka, readline, redis, Reflection, session, shmop, SimpleXML, soap, sockets, sodium, SPL, sqlite3, standard, swoole, sysvmsg, sysvsem, sysvshm, tidy, tokenizer, uploadprogress, uuid, xdebug, xml, xmlreader, xmlrpc, xmlwriter, xsl, yaml, Zend OPcache, zip, zlib, Xdebug, Zend OPcache, blackfire
  - Workdir `/srv`
- `drupalista/redis`
  - Based on `redis:5`
  - Update using unix socket

```bash
make build
make test
make run
```

The checked-in `docker-compose.yml` exposes the web application on `8000`, Adminer on `8010`, PostgreSQL on `5432` and Redis on `6379`.

## Maintenance

See [how to contribute](https://github.com/dockette/.github/blob/master/CONTRIBUTING.md) to this package. Consider to [support](https://github.com/sponsors/f3l1x) **f3l1x**. Thank you for using this package.
