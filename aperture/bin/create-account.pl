#!/usr/bin/perl
#
# Create an Aperture user
#
# Copyright (C) 2014 and later, Indie Computing Corp. All rights reserved. License: see package.
#

use strict;

use UBOS::Logging;
use UBOS::Utils;

my $ret = 1;

if( 'install' eq $operation ) {
    my $dir     = $config->getResolve( 'appconfig.apache2.dir' );
    my $userUrl = $config->getResolve( 'installable.customizationpoints.userurl.value' );

    my $out;
    if( UBOS::Utils::myexec( "cd '$dir' && /usr/bin/php artisan create:user '$userUrl'", undef, \$out, \$out )) {
        error( "Aperture php artisan create:user $userUrl failed:", $out );
    }
}

1;
