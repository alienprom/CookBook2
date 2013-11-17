use strict;
use warnings;
use Test::More;


use Catalyst::Test 'CookBook2';
use CookBook2::Controller::Resipes;

ok( request('/resipes')->is_success, 'Request should succeed' );
done_testing();
