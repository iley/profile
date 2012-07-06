#!/usr/bin/perl -wl
use strict;

my %modules;

while (<>) {
	for (/(\w+(?:::\w+)+)/g) {
		$modules{$_} = undef;
	}
}

for (sort keys %modules) {
	print "use $_ ();";
}
