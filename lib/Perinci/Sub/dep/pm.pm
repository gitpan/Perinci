package Perinci::Sub::dep::pm;

use 5.010;
use strict;
use warnings;

use Perinci::Util qw(declare_function_dep);

our $VERSION = '0.08'; # VERSION

declare_function_dep(
    name => 'pm',
    schema => ['str*' => {}],
    check => sub {
        my ($val) = @_;
        my $m = $val;
        $m =~ s!::!/!g;
        $m .= ".pm";
        #eval { require $m } ? "" : "Can't load module $val: $@";
        eval { require $m } ? "" : "Can't load module $val";
    }
);

1;
# ABSTRACT: Depend on a Perl module


__END__
=pod

=head1 NAME

Perinci::Sub::dep::pm - Depend on a Perl module

=head1 VERSION

version 0.08

=head1 SYNOPSIS

 # in function metadata
 deps => {
     ...
     pm => 'Foo::Bar',
 }

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

