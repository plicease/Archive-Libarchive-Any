package
  Archive::Libarchive::Any::_version;

# PODNAME: (Deprecated) Archive::Libarchive::Any
# VERSION

use strict;
use warnings;

BEGIN {
  my $ok = 0;

  my @list = qw( XS FFI );
  unshift @list, $ENV{ARCHIVE_LIBARCHIVE_ANY}
    if defined $ENV{ARCHIVE_LIBARCHIVE_ANY};

  foreach my $impl (@list)
  {
    next if $impl eq 'Any';
    my $str = qq{
      use Archive::Libarchive::$impl;
      *Archive::Libarchive::Any:: = *Archive::Libarchive::$impl\::;
    };
    eval $str;
    if($@) {
      warn "Archive::Libarchive::$impl\: $@"
        if $ENV{ARCHIVE_LIBARCHIVE_ANY_VERBOSE};
    } else {
      $ok = 1;
      last;
    }
  }
  die "could not find an appropriate libarchive implementation" unless $ok;
};

package Archive::Libarchive::Any;

# ABSTRACT: Perl bindings to libarchive

if(0) {

# VERSION

}

=head1 SYNOPSIS

 use Archive::Libarchive::Any;

=head1 DESCRIPTION

B<NOTE>: This module has been deprecated in favor of L<Archive::Libarchive>.
It provides a better thought out object-oriented interface and is easier
to maintain.

B<NOTE>: This repository has been archived as it is no longer supported or
maintained.  You may submitt a ticket at its replacement repository:

=over 4

=item L<https://github.com/uperl/Archive-Libarchive/issues>

=back

This module provides bindings for libarchive using either
L<Archive::Libarchive::XS> or L<Archive::Libarchive::FFI>.
The interface is identical either way.

The preference and install and run time is at the discretion
of the author of this distribution, and is subject to change
with reasonable notice in the documentation and Changes file.

Generally the XS version will be preferred, and the FFI
version will be used if the XS version is unavailable.

If you set the environment variable C<ARCHIVE_LIBARCHIVE_ANY>
to C<XS> or C<FFI> it will prefer that implementation over the
other (this is used both at install and runtime).

=head1 SUPPORT

If you find bugs, please open an issue on the project GitHub repository:

L<https://github.com/plicease/Archive-Libarchive-Any/issues?state=open>

If you have a fix, please open a pull request.  You can see the CONTRIBUTING
file for traps, hints and pitfalls.

=head1 SEE ALSO

The intent of this module is to provide a low level fairly thin direct
interface to libarchive, on which a more Perlish OO layer could easily
be written.

=over 4

=item L<Archive::Libarchive::XS>

=item L<Archive::Libarchive::FFI>

Both of these provide the same API to libarchive via L<Alien::Libarchive>,
but the bindings are implemented in XS for one and via L<FFI::Sweet> for
the other.

=item L<Archive::Libarchive::Any>

Offers whichever is available, either the XS or FFI version.  The
actual algorithm as to which is picked is subject to change, depending
on with version seems to be the most reliable.

=item L<Archive::Peek::Libarchive>

=item L<Archive::Extract::Libarchive>

Both of these provide a higher level, less complete perlish interface
to libarchive.

=item L<Archive::Tar>

=item L<Archive::Tar::Wrapper>

Just some of the many modules on CPAN that will read/write tar archives.

=item L<Archive::Zip>

Just one of the many modules on CPAN that will read/write zip archives.

=item L<Archive::Any>

A module attempts to read/write multiple formats using different methods
depending on what perl modules are installed, and preferring pure perl
modules.

=back

=cut

1;
