package Perinci::Access::Base;

use 5.010;
use strict;
use warnings;

use Scalar::Util qw(blessed);
use URI;

our $VERSION = '0.06'; # VERSION

sub new {
    my ($class, %opts) = @_;
    my $obj = bless \%opts, $class;
    $obj->_init();
    $obj;
}

our $re_var     = qr/\A[A-Za-z_][A-Za-z_0-9]*\z/;
our $re_req_key = $re_var;
our $re_action  = $re_var;

sub request {
    my ($self, $action, $uri, $extra) = @_;
    my $req = {};

    # check args

    $extra //= {};
    return [400, "Invalid extra arguments: must be hashref"]
        unless ref($extra) eq 'HASH';
    for my $k (keys %$extra) {
        return [400, "Invalid request key '$k', ".
                    "please only use letters/numbers"]
            unless $k =~ $re_req_key;
        $req->{$k} = $extra->{$k};
    }

    $req->{v} //= 1.1;
    return [500, "Protocol version not supported"] if $req->{v} ne '1.1';

    return [400, "Please specify action"] unless $action;
    return [400, "Invalid syntax in action, please only use letters/numbers"]
        unless $action =~ $re_action;
    $req->{action} = $action;

    my $meth = "action_$action";
    return [502, "Action not implemented"] unless
        $self->can($meth);

    return [400, "Please specify URI"] unless $uri;
    $uri = URI->new($uri) unless blessed($uri);
    $req->{uri} = $uri;

    my $res = $self->_before_action($req);
    return $res if $res;

    return [502, "Action not implemented for '$req->{-type}' entity"]
        unless $self->{_typeacts}{ $req->{-type} }{ $action };

    $res = $self->$meth($req);
}

sub _init {
    require Class::Inspector;

    my ($self) = @_;

    # build a list of supported actions for each type of entity
    my %typeacts; # key = type, val = {action1=>meta, ...}

    my @comacts;
    for my $meth (@{Class::Inspector->methods(ref $self)}) {
        next unless $meth =~ /^actionmeta_(.+)/;
        my $act = $1;
        my $meta = $self->$meth();
        for my $type (@{$meta->{applies_to}}) {
            if ($type eq '*') {
                push @comacts, [$act, $meta];
            } else {
                push @{$typeacts{$type}}, [$act, $meta];
            }
        }
    }

    for my $type (keys %typeacts) {
        $typeacts{$type} = { map {$_->[0] => $_->[1]}
                                 @{$typeacts{$type}}, @comacts };
    }

    $self->{_typeacts} = \%typeacts;
}

# can be overriden, should return a response on error, or false if nothing is
# wrong.
sub _before_action {}

sub actionmeta_info { +{
    applies_to => ['*'],
    summary    => "Get general information on code entity",
} }

sub action_info {
    my ($self, $req) = @_;
    [200, "OK", {
        v    => 1.1,
        uri  => $req->{uri}->as_string,
        type => $req->{-type},
    }];
}

sub actionmeta_actions { +{
    applies_to => ['*'],
    summary    => "List available actions for code entity",
} }

sub action_actions {
    my ($self, $req) = @_;
    my @res;
    for my $k (sort keys %{ $self->{_typeacts}{$req->{-type}} }) {
        my $v = $self->{_typeacts}{$req->{-type}}{$k};
        if ($req->{detail}) {
            push @res, {name=>$k, summary=>$v->{summary}};
        } else {
            push @res, $k;
        }
    }
    [200, "OK", \@res];
}

sub actionmeta_list { +{
    applies_to => ['package'],
    summary    => "List code entities inside this package code entity",
} }

sub actionmeta_meta { +{
    applies_to => ['*'],
    summary    => "Get metadata",
} }

sub actionmeta_call { +{
    applies_to => ['function'],
    summary    => "Call function",
} }

sub actionmeta_complete_arg_val { +{
    applies_to => ['function'],
    summary    => "Complete function's argument value"
} }

1;
# ABSTRACT: Base class for Perinci Riap clients

__END__
=pod

=head1 NAME

Perinci::Access::Base - Base class for Perinci Riap clients

=head1 VERSION

version 0.06

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

