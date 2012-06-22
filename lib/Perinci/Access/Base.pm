package Perinci::Access::Base;

use 5.010;
use strict;
use warnings;

our $VERSION = '0.21'; # VERSION

sub new {
    my ($class, %opts) = @_;
    my $obj = bless \%opts, $class;
    $obj->_init();
    $obj;
}

our $re_var     = qr/\A[A-Za-z_][A-Za-z_0-9]*\z/;
our $re_req_key = $re_var;
our $re_action  = $re_var;

# do some basic sanity checks on request
sub check_request {
    my ($self, $req) = @_;

    # XXX schema
    #$req //= {};
    #return [400, "Invalid req: must be hashref"]
    #    unless ref($req) eq 'HASH';

    # skipped for squeezing out performance
    #for my $k (keys %$req) {
    #    return [400, "Invalid request key '$k', ".
    #                "please only use letters/numbers"]
    #        unless $k =~ $re_req_key;
    #}

    $req->{v} //= 1.1;
    return [500, "Protocol version not supported"] if $req->{v} ne '1.1';

    my $action = $req->{action};
    return [400, "Please specify action"] unless $action;
    return [400, "Invalid action, please only use letters/numbers"]
        unless $action =~ $re_action;

    # return success for further processing
    0;
}

1;
# ABSTRACT: Base class for Perinci Riap clients

__END__
=pod

=head1 NAME

Perinci::Access::Base - Base class for Perinci Riap clients

=head1 VERSION

version 0.21

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

