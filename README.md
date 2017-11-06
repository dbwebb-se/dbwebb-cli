dbwebb-cli version 3
================================

[![Join the chat at https://gitter.im/dbwebb-se/dbwebb-cli](https://badges.gitter.im/dbwebb-se/dbwebb-cli.svg)](https://gitter.im/dbwebb-se/dbwebb-cli?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![Packagist](https://poser.pugx.org/dbwebb/dbwebb-cli/v/stable)](https://packagist.org/packages/dbwebb/dbwebb-cli)
[![npm version](https://badge.fury.io/js/%40dbwebb%2Fdbwebb-cli.svg)](https://badge.fury.io/js/%40dbwebb%2Fdbwebb-cli)
[![Travis](https://travis-ci.org/dbwebb-se/dbwebb-cli.svg?branch=master)](https://travis-ci.org/dbwebb-se/dbwebb-cli)
[![CircleCI](https://circleci.com/gh/dbwebb-se/dbwebb-cli.svg?style=svg)](https://circleci.com/gh/dbwebb-se/dbwebb-cli)

A CLI client to work with dbwebb courses, built in bash.

This is development of version 3 for dbwebb-cli, a complete rewrite of the codebas. Version 1 and 2 is available in [mosbth/dbwebb-cli](https://github.com/mosbth/dbwebb-cli).



Documentation
------------------

There is documentation on [dbwebb.se/dbwebb-cli](https://dbwebb.se/dbwebb-cli) (swedish only).

Or use the built-in `dbwebb help <command>` which is in english.



Install
------------------

Download and install using installation program or using composer.



### Installation program

Download and install to `/usr/local/bin` or `/usr/bin`. Use `sudo` if needed.

Using curl for download.

```bash
bash -c "$(curl -s https://raw.githubusercontent.com/dbwebb-se/dbwebb-cli/master/release/latest/install)"
```

Using wget for download.

```bash
bash -c "$(wget -qO- https://raw.githubusercontent.com/dbwebb-se/dbwebb-cli/master/release/latest/install)"
```



### Composer

Install using composer as part of you development environment.

```bash
composer require dbwebb/dbwebb-cli
vendor/bin/dbwebb --version
```



License
------------------

This software carries a MIT license.



```
 .  
..:  Copyright (c) 2013 - 2017 Mikael Roos, mos@dbwebb.se
```
