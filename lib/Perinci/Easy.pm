package Perinci::Easy;

use 5.010;
use strict;
use warnings;

our @ISA = qw(Exporter);
our @EXPORT_OK = qw(defsub);

our %SPEC;

$SPEC{defsub} = {
    v       => 1.1,
    summary => 'Define a subroutine',
    description => <<'_',

This is just a shortcut to define subroutine and meta together so instead of:

    our %SPEC;
    $SPEC{foo} = {
        v => 1.1,
        summary => 'Blah ...',
    };
    sub foo {
        ...
    }

you write:

    defsub name=>'foo', summary=>'Blah ...',
        code=>sub {
            ...
        };

_
};
sub defsub(%) {
    my %args = @_;
    my $name = $args{name} or die "Please specify subroutine's name";
    my $code = $args{code} or die "Please specify subroutine's code";

    my $spec = {%args};
    delete $spec->{code};
    $spec->{v} //= 1.1;

    no strict 'refs';
    my ($callpkg, undef, undef) = caller;
    ${$callpkg . '::SPEC'}{$name} = $spec;
    *{$callpkg . "::$name"} = $code;
}

sub defvar {
}

sub defpkg {
}

sub defclass {
}

our $VERSION = '0.25'; # VERSION

1;
# ABSTRACT: Some shortcuts


__END__
=pod

=head1 NAME

Perinci::Easy - Some shortcuts

=head1 VERSION

version 0.25

=head1 DESCRIPTION

This module provides some shortcuts.

=head1 SEE ALSO

L<Perinci>

=head1 DESCRIPTION


This module has L<Rinci> metadata.

=head1 FUNCTIONS


None are exported by default, but they are exportable.

=head2 defsub() -> [status, msg, result, meta]

Define a subroutine.

This is just a shortcut to define subroutine and meta together so instead of:

    our %SPEC;
    $SPEC{foo} = {
        v => 1.1,
        summary => 'Blah ...',
    };
    sub foo {
        ...
    }

you write:

    defsub name=>'foo', summary=>'Blah ...',
        code=>sub {
            ...
        };

No arguments.

Return value:

Returns an enveloped result (an array). First element (status) is an integer containing HTTP status code (200 means OK, 4xx caller error, 5xx function error). Second element (msg) is a string containing error message, or 'OK' if status is 200. Third element (result) is optional, the actual result. Fourth element (meta) is called result metadata and is optional, a hash that contains extra information.

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

