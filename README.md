# Archive::Libarchive::Any [![Build Status](https://secure.travis-ci.org/plicease/Archive-Libarchive-Any.png)](http://travis-ci.org/plicease/Archive-Libarchive-Any)

Perl bindings to libarchive

# SYNOPSIS

    use Archive::Libarchive::Any;

# DESCRIPTION

This module provides bindings for libarchive using either
[Archive::Libarchive::XS](https://metacpan.org/pod/Archive::Libarchive::XS) or [Archive::Libarchive::FFI](https://metacpan.org/pod/Archive::Libarchive::FFI).
The interface is identical either way.

The preference and install and run time is at the discretion
of the author of this distribution, and is subject to change
with reasonable notice in the documentation and Changes file.

Generally the XS version will be preferred, and the FFI
version will be used if the XS version is unavailable.

If you set the environment variable `ARCHIVE_LIBARCHIVE_ANY`
to `XS` or `FFI` it will prefer that implementation over the
other (this is used both at install and runtime).

# SUPPORT

If you find bugs, please open an issue on the project GitHub repository:

[https://github.com/plicease/Archive-Libarchive-Any/issues?state=open](https://github.com/plicease/Archive-Libarchive-Any/issues?state=open)

If you have a fix, please open a pull request.  You can see the CONTRIBUTING
file for traps, hints and pitfalls.

# SEE ALSO

The intent of this module is to provide a low level fairly thin direct
interface to libarchive, on which a more Perlish OO layer could easily
be written.

- [Archive::Libarchive::XS](https://metacpan.org/pod/Archive::Libarchive::XS)
- [Archive::Libarchive::FFI](https://metacpan.org/pod/Archive::Libarchive::FFI)

    Both of these provide the same API to libarchive via [Alien::Libarchive](https://metacpan.org/pod/Alien::Libarchive),
    but the bindings are implemented in XS for one and via [FFI::Sweet](https://metacpan.org/pod/FFI::Sweet) for
    the other.

- [Archive::Libarchive::Any](https://metacpan.org/pod/Archive::Libarchive::Any)

    Offers whichever is available, either the XS or FFI version.  The
    actual algorithm as to which is picked is subject to change, depending
    on with version seems to be the most reliable.

- [Archive::Peek::Libarchive](https://metacpan.org/pod/Archive::Peek::Libarchive)
- [Archive::Extract::Libarchive](https://metacpan.org/pod/Archive::Extract::Libarchive)

    Both of these provide a higher level, less complete perlish interface
    to libarchive.

- [Archive::Tar](https://metacpan.org/pod/Archive::Tar)
- [Archive::Tar::Wrapper](https://metacpan.org/pod/Archive::Tar::Wrapper)

    Just some of the many modules on CPAN that will read/write tar archives.

- [Archive::Zip](https://metacpan.org/pod/Archive::Zip)

    Just one of the many modules on CPAN that will read/write zip archives.

- [Archive::Any](https://metacpan.org/pod/Archive::Any)

    A module attempts to read/write multiple formats using different methods
    depending on what perl modules are installed, and preferring pure perl
    modules.

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
