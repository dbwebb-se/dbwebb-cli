dbwebb-cli version 3 how to devellop
================================

[![Documentation Status](https://readthedocs.org/projects/dbwebb-cli/badge/?version=latest)](https://dbwebb-cli.readthedocs.io/en/latest/?badge=latest)

[![Packagist](https://poser.pugx.org/dbwebb/dbwebb-cli/v/stable)](https://packagist.org/packages/dbwebb/dbwebb-cli)
[![npm version](https://badge.fury.io/js/%40dbwebb%2Fdbwebb-cli.svg)](https://badge.fury.io/js/%40dbwebb%2Fdbwebb-cli)
[![CircleCI](https://circleci.com/gh/dbwebb-se/dbwebb-cli.svg?style=svg)](https://circleci.com/gh/dbwebb-se/dbwebb-cli)

This is how to develop the tool and more on advanced usage.



Clone and run the app
------------------

Clone the repo and run the app like this.

```
git clone git@github.com:dbwebb-se/dbwebb-cli.git
cd dbwebb-cli

src/dbw.bash help
```



Linter
------------------

The code must pass the linter shellcheck.

```
docker-compose run shellcheck --shell=bash src/*.bash
# or
make shellcheck
```



Unit tests
------------------

Each feature must be covered by unit tests. Execute the test suite like this.

```
docker-compose run bats test
# or
make bats
```



Tests
------------------

Execute all tests.

```
make test
```



Release, prepare to tag and install
------------------

Make a new release and prepare to tag repo with new version.

```
make release tag
```

Install a local copy of the latest version.

```
# From the latest release locally
make install-app

# Using the install script to install from GitHub source
bash -c "$(cat src/install.bash)"
```



Documentation
------------------

Where to store the docs?

* https://dbwebb-cli.readthedocs.io/en/latest/



Alternate ways of installing
------------------

This section is not verified to work with the latest setup, use it with care or better - ignore.



### Install using clone and make

Local install.

```
make install-app
```



### Install using composer

Install [`dbwebb/dbwebb-cli`](https://packagist.org/packages/dbwebb/dbwebb-cli) using composer as part of you development environment.

```bash
composer require dbwebb/dbwebb-cli
vendor/bin/dbwebb --version
```



### Install using npm

Install [`@dbwebb/dbwebb-cli`](https://www.npmjs.com/package/@dbwebb/dbwebb-cli) using npm as part of you development environment.

```bash
npm install @dbwebb/dbwebb-cli
node_modules/.bin/dbwebb --version
```



### Use through docker

You can run the tool through docker-compose like this.

```
docker-compose run dbw
```



License
------------------

This software carries a MIT license.



```
 .  
..:  Copyright (c) 2013 - 2024 Mikael Roos, mos@dbwebb.se
```
