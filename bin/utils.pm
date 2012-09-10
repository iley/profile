package utils;
use strict;
use warnings;

sub is_installed {
    system "command -v $[0] >/dev/null 2>&1" == 0;
}

sub notify {
    my $message = shift;
    system "notify-send '$message'";
}

1;
