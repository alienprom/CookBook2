package CookBook2::View::TT;
use Moose;
use namespace::autoclean;

extends 'Catalyst::View::TT';

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt',
    render_die        => 1,
    CATALYST_VAR      => 'c',
    ENCODING          => 'utf-8',
);

=head1 NAME

CookBook2::View::TT - TT View for CookBook2

=head1 DESCRIPTION

TT View for CookBook2.

=head1 SEE ALSO

L<CookBook2>

=head1 AUTHOR

arch

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
