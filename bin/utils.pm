package utils;
require Exporter;
@ISA = qw(Exporter);
@EXPORT_OK = qw(is_installed notify);
use strict;
use warnings;

sub is_installed {
    my $res = system("command -v $_[0] >/dev/null 2>&1");
    return $res == 0;
}

sub notify {
    my $message = shift;
    system "notify-send '$message'";
}

1;
