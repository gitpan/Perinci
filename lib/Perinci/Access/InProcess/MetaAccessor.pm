package Perinci::Access::InProcess::MetaAccessor;

use 5.010;
use strict;
use warnings;

our $VERSION = '0.23'; # VERSION

# static method
sub get_meta {
    my ($class, $req) = @_;
    my $leaf   = $req->{-leaf};
    my $key = $req->{-leaf} || ':package';
    no strict 'refs';
    ${ $req->{-module} . "::SPEC" }{$key};
}

sub get_all_meta {
    my ($class, $req) = @_;
    no strict 'refs';
    \%{ $req->{-module} . "::SPEC" };
}

1;
# ABSTRACT: Default class to access metadata in

__END__
=pod

=head1 NAME

Perinci::Access::InProcess::MetaAccessor - Default class to access metadata in

=head1 VERSION

version 0.23

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

