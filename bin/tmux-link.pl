#!/usr/bin/env perl
use strict;
use warnings;

use constant WINDOWS => 3;

my $name = shift;
$name or die "Usage: tmux-link name";

system "tmux rename-session $name";

my @sessions =
    grep {$_ ne $name}
        map {s/^([^:]+):.*$/$1/; $_}
            split /\n/, `tmux list-sessions`;

my $open_windows = split /\n/, `tmux list-windows`; 
system "tmux new-window" for (($open_windows+1)..WINDOWS);
system "tmux select-window -t :1";

for my $session (@sessions) {
    for my $i (1..WINDOWS) {
        system "tmux link-window -dk -s $name:$i -t $session:$i";
    }
}
