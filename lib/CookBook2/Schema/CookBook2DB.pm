use utf8;
package CookBook2::Schema::CookBook2DB;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use Moose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Schema';

__PACKAGE__->load_namespaces;


# Created by DBIx::Class::Schema::Loader v0.07037 @ 2013-11-16 13:08:47
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:o2U/ThWvuG9gZoxyNxFStw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable(inline_constructor => 0);
1;
