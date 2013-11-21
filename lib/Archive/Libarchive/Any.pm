package Archive::Libarchive::Any;

use strict;
use warnings;

# ABSTRACT: Perl bindings to libarchive
# VERSION

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

If you set the environment variable ARCHIVE_LIBARCHIVE_ANY
to XS or FFI it will prefer that implementation over the
other (this is used both at install and runtime).

=cut

do {
  my $ok = 0;
  
  my @list = qw( XS FFI );
  unshift @list, $ENV{ARCHIVE_LIBARCHIVE_ANY}
    if defined $ENV{ARCHIVE_LIBARCHIVE_ANY};
  
  foreach my $impl (@list)
  {
    next if $impl eq 'Any';
    my $str = qq{
      use Archive::Libarchive::$impl ':all';
      \*import = \\\&Archive::Libarchive::$impl\::import;
    };
    eval $str;
    if($@) {
      #warn $@;
    } else {
      $ok = 1;
      last;
    }
  }
  die "could not find an appropriate libarchive implementation" unless $ok;
};

1;
