package CookBook2::Controller::Root;
use Moose;
use namespace::autoclean;
use utf8;

# BEGIN { extends 'Catalyst::Controller'; }
BEGIN { extends qw/
Catalyst::Controller::HTML::FormFu
/ }

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config(namespace => '');

=encoding utf-8

=head1 NAME

CookBook2::Controller::Root - Root Controller for CookBook2

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=head2 index

The root page (/)

=cut

# sub index :Path :Args(0) {
#    my ( $self, $c ) = @_;
#
#    $c->response->redirect('/index');
# }

=head2 default

Standard 404 error page

=cut

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}


=head2 index

=cut

sub index :Chained('') :Path :Args(0) {
    my ( $self, $c ) = @_;

    # $c->response->body('Matched CookBook2::Controller::Resipes in Resipes.');

    # $c->stash->{template} = '/index.tt';
    # $c->forward('View::TT');

    $c->stash->{resipes_list} = [$c->model('CookBook2DB::cookbook')->search({})->all];
    # $c->stash->{resipes_list} = [$c->model('CookBook2DB::cookbook')->all];
    $c->stash->{template} = 'resipes.tt';
    $c->forward('View::TT');
}

=head2 remove

Удаление рецепта по id

=cut

sub remove :Chained('') :Path('remove') :Args(1) {
    my ( $self, $c, $id ) = @_;
  
    $c->model('CookBook2DB::cookbook')->find({ id => $id})->delete;
    $c->res->redirect($c->uri_for('/index'));
  }

=head2 update

Редактирование и обновление рецепта

=cut

sub update :Chained('') :Path('update') :Args(1) :FormConfig('update.yml') {
    my ( $self, $c, $id) = @_;

    my $form = $c->stash->{form};

    if ($form->submitted_and_valid) {
        eval {
            my $obj = $c->model('CookBook2DB::cookbook')->update_or_create({
                id => $form->param_value('id'),
                name => $form->param_value('name') || undef,
                type => $form->param_value('type') || undef,
                ingredients => $form->param_value('ingredients') || undef,
                process => $form->param_value('process') || undef
            });
        };
      $c->warn('Ошибка дублирования записей') if $@;

      $c->stash->{template} = 'message.tt';
      $c->stash->{message} = 'Рецепт обновлен';
      $c->forward('View::TT');

      } else {
          my $resipe = $c->model('CookBook2DB::cookbook')->search( {
              id => $id,
          } )->first;
          $c->stash->{form}->default_values({
              'name' => $resipe->name,
              'type' => $resipe->type,
              'id' => $resipe->id,
              'ingredients' => $resipe->ingredients,
              'process' => $resipe->process
          });
      }

      # $c->stash->{template} = 'update.tt';
      # $c->forward('View::TT');
}

=head2 create

Создание нового рецепта.

=cut

sub create :Chained('') :Path('create') :Args(0) :FormConfig('create.yml') {
    my ( $self, $c, $id ) = @_;
    my $form = $c->stash->{form};

    if ($form->submitted_and_valid) {
        eval {
            my $obj = $c->model('CookBook2DB::cookbook')->create({
                name => $form->param_value('name') || undef,
                type => $form->param_value('type') || undef,
                ingredients => $form->param_value('ingredients') || undef,
                process => $form->param_value('process') || undef
            });
        };

        $c->warn('Ошибка дублирования данных') if $@;

        $c->stash->{template} = 'message.tt';
        $c->stash->{message} = 'Рецепт добавлен';
        $c->forward('View::TT');
        
        # $c->response->redirect($c->uri_for($self->action_for('index')));
        # $c->detach;
    } else {
      
          $c->stash->{template} = 'create.tt';
          $c->forward('View::TT');
    }

}



=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {}

=head1 AUTHOR

arch

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
