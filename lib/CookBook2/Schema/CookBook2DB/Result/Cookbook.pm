use utf8;
package CookBook2::Schema::CookBook2DB::Result::Cookbook;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CookBook2::Schema::CookBook2DB::Result::Cookbook

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<cookbook>

=cut

__PACKAGE__->table("cookbook");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 50

=head2 type

  data_type: 'varchar'
  is_nullable: 0
  size: 50

=head2 ingredients

  data_type: 'varchar'
  is_nullable: 0
  size: 50

=head2 process

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 50 },
  "type",
  { data_type => "varchar", is_nullable => 0, size => 50 },
  "ingredients",
  { data_type => "varchar", is_nullable => 0, size => 50 },
  "process",
  { data_type => "varchar", is_nullable => 0, size => 255 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07037 @ 2013-11-16 13:08:47
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:pVuAVXJ4SExpmnWTL0uZDQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
