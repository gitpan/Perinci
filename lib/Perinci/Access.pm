package Perinci::Access;

use 5.010;
use strict;
use warnings;

1;
# ABSTRACT: Wrapper for Perinci Riap clients


__END__
=pod

=head1 NAME

Perinci::Access - Wrapper for Perinci Riap clients

=head1 VERSION

version 0.01

=head1 SYNOPSIS

 use Perinci::Access;

 # XXX

=head1 DESCRIPTION

This module provides a convenient interface to select appropriate Riap client
class based on URI scheme (or lack thereof).

 # XXX temp, illustration
 Foo::Bar -> InProcess (/Foo/Bar/)
 /Foo/Bar/ -> InProcess
 http://... -> HTTP
 https://... -> HTTP
 riap+http:// ? (url scheme is riap uri://     -> TCP?
 riap+tcp:// -> TCP

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

