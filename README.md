DisplayLink DEB
===============
[![Build Status](https://travis-ci.org/hadogenes/displaylink-deb.svg?branch=master)](https://travis-ci.org/hadogenes/displaylink-deb)

This is the recipe for building the [DisplayLink driver][displaylink]
in a DEB package for Debian. This driver supports the following
device families:
 - DL-6xxx
 - DL-5xxx
 - DL-41xx
 - DL-3xxx

Packages get automatically built by Travis CI and get uploaded to
[GitHub releases][releases].

[displaylink]: http://www.displaylink.com/
[evdi]: https://github.com/DisplayLink/evdi
[releases]: https://github.com/hadogenes/displaylink-deb/releases

Usage
=====

This package requires evdi lib, which is packaged [evdi-deb](https://github.com/hadogenes/evdi-deb) repository

In order to compile the driver, just use make. The Makefile should
download the file for you.


Contributing
============

The easiest way to contribute with the package is to fork it and send
a pull request in GitHub.

There are two main kind of contributions: either a new upstream
version is released or a modification in the packaging is proposed.

There is a variable called `RELEASE` for packaging purposes. That
variable should be set to 1 when contributing a new upstream version
release, and incremented in one when adding any other functionality to
the specfile for the same upstream version.


New Upstream release
--------------------

Add info to debian/changelog and commit
