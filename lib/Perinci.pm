package Perinci;

our $VERSION = '0.03'; # VERSION

1;
# ABSTRACT: Collection of Perl modules for Rinci and Riap





__END__
=pod

=head1 NAME

Perinci - Collection of Perl modules for Rinci and Riap

=head1 VERSION

version 0.03

=head1 DESCRIPTION

Perinci is a collection of modules for implementing/providing tools pertaining
to L<Rinci> and L<Riap>, spread over several distributions for faster
incremental releases. These tools include:

=over 4

=item * Wrapper

L<Perinci::Sub::Wrapper> is the subroutine wrapper which implements/enforces
many of the metadata properties, like argument validation (using information in
C<args>) as well as offers features like convert argument passing style,
automatically envelope function result, etc.

It is extensible so you can implement wrapper for your properties too.

=item * Riap clients and servers (Perinci::Access::*)

L<Perinci::Access::InProcess> is a client/server (well, neither really, since
everything is in-process) to access Perl modules/functions using the Riap
protocol. It is basically a way to call your modules/functions using URI syntax;
it also dictates a bit on how you should write your functions and where to put
the metadata, though it provides a lot of flexibility.

L<Perinci::Access::HTTP::Client> and L<Perinci::Access::HTTP::Server> is a pair
of client/server library to access Perl modules/functions using Riap over HTTP,
implementing the L<Riap::HTTP> specification.

L<Perinci::Access::TCP::Client> and L<Perinci::Access::TCP::Server> is a pair of
client/server library to access Perl modules/functions using Riap over TCP,
implementing the L<Riap::TCP> specification.

L<Perinci::Access> is a simple wrapper for all Riap clients, you give it a
URL/module name/whatever and it will try to select the appropriate Riap client
for you.

=item * Command-line libraries

L<Perinci::CmdLine> is an extensible and featureful command-line library to
create command-line programs and API clients. Features include: transparent
remote access (thanks to Riap::HTTP), command-line options parsing, --help
message, shell tab completion, etc.

=item * Documentation tools

See CPAN for L<Perinci::Package::To::POD>, L<Perinci::Sub::To::POD>,
L<Perinci::Sub::To::Text::Usage>, L<Perinci::Sub::To::HTML>, and other
Perinci::To::* modules.

=item * Function/metadata generators

These are convenient tools to generate common/generic function and/or metadata.
For example, L<Perinci::Sub::Gen::AccessTable> can generate accessor function +
metadata for table data.

See CPAN for more Perinci::Sub::Gen::* modules.

=item * Others

Samples: L<Perinci::Use>, L<Perinci::Exporter>.

See CPAN for more Perinci::* modules.

=back

To get started, read L<Perinci::Access::InProcess> which will tell you on how to
write your functions and where to put the metadata. Or, if you only want to
access existing code/metadata, head over to L<Perinci::Access> or
L<Perinci::CmdLine>.

To declare and implement a new function metadata property, see example in one of
the C<Perinci-Sub-property-*> modules, like L<Perinci::Sub::property::timeout>.

To declare and implement a new function feature, see example in one of the
C<Perinci-Sub-feature-*> modules, like L<Perinci::Sub::feature::foo>.

To declare and implement a new function dependency type, see example in one of
the C<Perinci-Sub-dep-*> modules, like L<Perinci::Sub::dep::pm>.

=head1 STATUS

Some modules have been implemented, some (including important ones) have not.
See details on CPAN.

=head1 FAQ

=head2 What does Perinci mean?

Perinci is taken from Indonesian word, meaning: to specify, to explain in more
detail. It can also be an abbreviation for "B<Pe>rl implementation of B<Rinci>".

=head1 SEE ALSO

L<Rinci>

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

