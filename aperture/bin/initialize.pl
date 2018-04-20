#!/usr/bin/perl
#
# Run init code
#
# Copyright (C) 2014 and later, Indie Computing Corp. All rights reserved. License: see package.
#

use strict;

use UBOS::Logging;
use UBOS::Utils;

my $ret = 1;

if( 'install' eq $operation ) {
    my $dir = $config->getResolve( 'appconfig.apache2.dir' );

    my $out;
    if( UBOS::Utils::myexec( "cd '$dir' && /usr/bin/php artisan migrate", undef, \$out, \$out )) {
        error( "Aperture php artisan migrate failed:", $out );
    }
}

1;
