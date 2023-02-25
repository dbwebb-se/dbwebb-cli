Revision history
=================================

v2.9.6* (2023-02-24)
v2.9.5* (2017-11-07)
---------------------------------

* TODO add code coverage to CI.
* TODO add code coverage.
* TODO finalize and cleanup selfupdate.
* TODO installation phase checksum sha1/md5.
* TODO installation.bash support both curl/wget.

* Fix file permissions when running bats locally and with docker.
* Add build of docker with dbwebb.bash.
* Rename bats/ to test/.
* Use bats from docker instead of install locally.
* Use shellcheck from docker instead of install locally.
* Make clean before make test.


v2.9.4 (2017-11-07)
---------------------------------

* Rewrite command selfupdate code to make it testable.
* Update installation code to make it testable.
* Add testcases for all commands.
* README to say how to install using npm.


v2.9.3 (2017-11-06)
---------------------------------

* Add as npm package.
* Add help command with help details for each command.
* Add details on environment variabels in dbwebb check.


v2.9.2 (2017-10-20)
---------------------------------

* Align version number and add tag-prepare.
* Make pass test.


v2.9.1 (2017-10-20)
---------------------------------

* New format of configuration file, do not use source.
* Fix initial dbwebb check.


v2.9.0 (2017-10-20)
---------------------------------

* Development version for v3.
* Installation script working.
* Integrated with travis, circle, bats for unit tests.
* First setup, to get going with development.


Earlier versions
---------------------------------

* Version 1 and 2 is available in [mosbth/dbwebb-cli](https://github.com/mosbth/dbwebb-cli).
