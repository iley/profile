#!/usr/bin/perl -wl
use strict;

my ($command, $pid) = @ARGV;

unless ($command && $pid) {
	print "Usage: runafter.pl command pid";
}


