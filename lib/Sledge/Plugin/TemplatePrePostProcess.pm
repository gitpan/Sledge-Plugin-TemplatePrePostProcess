package Sledge::Plugin::TemplatePrePostProcess;

use strict;
use vars qw($VERSION);
$VERSION = '0.01';

sub import {
    my $self   = shift;
    my $pkg    = caller(0);

    no strict 'refs';
    *{"$pkg\::set_header"} = _gen_func('PRE_PROCESS');
    *{"$pkg\::set_footer"} = _gen_func('POST_PROCESS');
}

sub _gen_func {
    my $pos = shift;

    return sub {
        my $self = shift;
        my $tmpl = shift;

        $self->register_hook(BEFORE_DISPATCH => sub {
            my $self = shift;
            $self->tmpl->add_option(
                $pos  => $tmpl,
            )
        });
    }
}

1;
__END__

=head1 NAME

Sledge::Plugin::TemplatePrePostProcess - header/footer plugin for Sledge

=head1 SYNOPSIS

  package Your::Pages;
  use base qw(Sledge::Pages::Base);
  use Sledge::Plugin::TemplatePrePostProcess;
  __PACKAGE__->set_header('include/header.html');
  __PACKAGE__->set_footer('include/footer.html');

=head1 DESCRIPTION

Sledge::Plugin::TemplatePrePostProcess is easy to set header/footer plugin for Sledge.

=head1 AUTHOR

MATSUNO Tokuhiro E<lt>tokuhirom at gmail dot comE<gt>

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

L<Bundle::Sledge>

=cut
