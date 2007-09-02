#!perl
package Term::VT102::ZeroBased;
use strict;
use warnings;
use parent 'Term::VT102';
use Class::Method::Modifiers;

around x => sub
{
    my $orig = shift;
    $orig->(@_) - 1;
};

around y => sub
{
    my $orig = shift;
    $orig->(@_) - 1;
};

around status => sub
{
    my $orig = shift;
    my ($x, $y, @others) = $orig->(@_);
    --$x;
    --$y;
    return ($x, $y, @others);
};

around row_attr => sub
{
    my $orig = shift;
    my ($self, $row, @rest) = @_;
    ++$row;
    $orig->($self, $row, @rest);
};

around row_text => sub
{
    my $orig = shift;
    my ($self, $row, @rest) = @_;
    ++$row;
    $orig->($self, $row, @rest);
};

around row_plaintext => sub
{
    my $orig = shift;
    my ($self, $row, @rest) = @_;
    ++$row;
    $orig->($self, $row, @rest);
};

=head1 NAME

Term::VT102::ZeroBased - Term::VT102 but with zero-based indices

=head1 VERSION

Version 0.82 released 02 Sep 07

=cut

our $VERSION = '0.82';

=head1 SYNOPSIS

  use Term::VT102::ZeroBased;

  my $vt = Term::VT102->new (cols => 80, rows => 24);
  $vt->process("\e[H");                    # move to top left
  printf "(%d, %d)!\n", $vt->x, $vt->y;    # (0, 0)!

=head1 DESCRIPTION

L<Term::VT102>, a module for terminal emulation, uses 1-based indices for
screen positions. I find this annoying. So this is a simple wrapper around
L<Term::VT102> that converts 1-based indices to 0-based indices.

See L<Term::VT102> for the documentation on using these modules.

=head1 SEE ALSO

L<Term::VT102>, L<Class::Method::Modifiers>

=head1 AUTHOR

Wrapper by Shawn M Moore, C<< <sartak at gmail dot com> >>

L<Term::VT102> by Andrew Wood C<< <andrew dot wood at ivarch dot com> >>

=head1 BUGS

No known bugs.

Please report any bugs in this module through RT: email
C<bug-term-vt102-zerobased at rt.cpan.org>, or browse to
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Term-VT102-ZeroBased>.

Consult the L<Term::VT102> documentation for reporting bugs in that module.

=head1 COPYRIGHT AND LICENSE

Copyright 2007 Shawn M Moore.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1;

