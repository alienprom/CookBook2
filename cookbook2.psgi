use strict;
use warnings;

use CookBook2;

my $app = CookBook2->apply_default_middlewares(CookBook2->psgi_app);
$app;

