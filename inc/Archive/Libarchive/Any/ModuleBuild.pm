package Archive::Libarchive::Any::ModuleBuild;

use strict;
use warnings;
use base qw( Module::Build );

sub new
{
  my($class, %args) = @_;
  
  if(eval { require Archive::Libarchive::FFI; 1 })
  {
    $args{requires}->{'Archive::Libarchive::FFI'} = 0;
  }
  else
  {
    $args{requires}->{'Archive::Libarchive::XS'} = 0;
  }
  
  $class->SUPER::new(%args);
}

1;
