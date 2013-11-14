package Archive::Libarchive::Any;

use strict;
use warnings;
use base qw( Exporter );

# ABSTRACT: Perl bindings to libarchive
# VERSION

=head1 SYNOPSIS

 use Archive::Libarchive::Any;

=head1 DESCRIPTION

This module provides bindings for libarchive using either
L<Archive::Libarchive::XS> or L<Archive::Libarchive::FFI>.
The interface is identical either way.

=head1 SEE ALSO

=over 4

=item L<Archive::Libarchive::XS>

=item L<Archive::Libarchive::FFI>

=back

=cut

do {
  my $ok = 0;
  foreach my $impl (qw( XS FFI ))
  {
    my $str = qq{
      use Archive::Libarchive::$impl ':all';
      *EXPORT_OK   = \\\@Archive::Libarchive::${impl}::EXPORT_OK;
      *EXPORT_TAGS = \\\%Archive::Libarchive::${impl}::EXPORT_TAGS;
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
