package
  Archive::Libarchive::Any::_version;

# PODNAME: Archive::Libarchive::Any
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

=cut

1;
