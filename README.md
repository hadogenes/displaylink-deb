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

From time to time, DisplayLink will update their driver. We try to do
so, but for that we usually rely on pull requests.

We manage three different upstream numbers for versioning:

1. evdi kernel driver version
2. DisplayLinkManager daemon and libraries version
3. Download ID number from DisplayLink (for automatic zip retrieval)

These variables need to be changed in the following places:

- Makefile
  - `DAEMON_VERSION` is the DisplayLinkManager version
  - `VERSION` is currently the evdi driver version
  - `DOWNLOAD_ID` is the `?download_id=` query parameter in
    DisplayLink website to download the zip
- .travis.yml
  - `VERSION` is the same as in the Makefile
  - `DAEMON_VERSION` is the same version as in Makefile

Also, please update the changelog at the bottom of the
displaylink.spec file.


Packaging change
----------------

When changing a packaging rule, please increment the `RELEASE`
variable by one in both displaylink.spec and .travis.yml (so that
Travis can release the new artifact automatically).
