#!/usr/bin/env perl
use strict;
use warnings;

use Getopt::Std;
use Term::ANSIColor;

use Data::Dumper;

use Statbox::LogParser::Multiformat;

my $logParser = Statbox::LogParser::Multiformat->new();

my %options;
getopt('ab', \%options);

my $keyColor = 'bold yellow';
my $valueColor = 'reset';

my %record;
while (<>) {
	chomp;
	my ($key, $subkey, $logLine) = split /\t/, $_, 3;

	%record = ();

	$logParser->parse($logLine, \%record)
		or next;

	print colored ("$key\t$subkey\t", $keyColor);
	foreach my $pairKey (sort keys %record) {
		print colored ("$pairKey", $keyColor), '=';
		print colored ("$record{$pairKey}", $valueColor), "\t";
	}
	print "\n\n";
}
