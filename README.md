dbwebb-cli version 3
================================

[![Documentation Status](https://readthedocs.org/projects/dbwebb-cli/badge/?version=latest)](https://dbwebb-cli.readthedocs.io/en/latest/?badge=latest)

[![Packagist](https://poser.pugx.org/dbwebb/dbwebb-cli/v/stable)](https://packagist.org/packages/dbwebb/dbwebb-cli)
[![npm version](https://badge.fury.io/js/%40dbwebb%2Fdbwebb-cli.svg)](https://badge.fury.io/js/%40dbwebb%2Fdbwebb-cli)
[![Travis](https://travis-ci.org/dbwebb-se/dbwebb-cli.svg?branch=master)](https://travis-ci.org/dbwebb-se/dbwebb-cli)
[![CircleCI](https://circleci.com/gh/dbwebb-se/dbwebb-cli.svg?style=svg)](https://circleci.com/gh/dbwebb-se/dbwebb-cli)

A CLI client `dbw` to work with dbwebb courses, built in bash.

This is development of version 3 for dbwebb-cli, a complete rewrite of the codebas. 

Version 1 and 2 is available in [mosbth/dbwebb-cli](https://github.com/mosbth/dbwebb-cli). The documentation for those older releases are available at [dbwebb.se/dbwebb-cli](https://dbwebb.se/dbwebb-cli) (swedish only).

Here follows the documentation for version 3 and the `dbw` utility.



Install
------------------

Download and install to `/usr/local/bin` or `/usr/bin`. Use `sudo` if needed. The executable will be installed as `dbw`.

Using curl for download.

```bash
bash -c "$(curl -s https://raw.githubusercontent.com/dbwebb-se/dbwebb-cli/master/release/latest/install)"
```

Using wget for download.

```bash
bash -c "$(wget -qO- https://raw.githubusercontent.com/dbwebb-se/dbwebb-cli/master/release/latest/install)"
```

Check where its installed and its version, just to make sure it works.

```bash
which dbw
dbw --version
```



dbw help
------------------

To print out the general help on the application.

```
dbw help
```

You can view details on how to get help for a certain command.

```
dbw help help
```



dbw check
------------------

This is to check your environment to troubleshoot if needed.

```
dbw check
```

Get help on the command.

```
dbw help check
```



dbw config
------------------

You can optionally create (and update) a configuration file for the utility.

```
dbw config
```

Get help on the command.

```
dbw help config
```



dbw repo
------------------

Each course repo can include its own utilities (commands) to execute. Use `dbw repo` to get details on the current repo and what utilities it has implemented.

```
dbw repo
```

Get help on the command.

```
dbw help repo
```



dbw selfupdate
------------------

Update the utility to its latest version, use sudo if needed.

```
sudo dbw selfupdate
```



<!--
Documentation
------------------

Or use the built-in `dbwebb help <command>`.
-->



License
------------------

This software carries a MIT license.



```
 .  
..:  Copyright (c) 2013 - 2024 Mikael Roos, mos@dbwebb.se
```
