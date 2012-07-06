#!/usr/bin/perl -wl
use strict;
use Statbox::DateFactory;

sub usage {
	die "usage: $0 {d|w|m} from_date [to_date]";
}

$, = "\t";
my %full = (
	d => 'daily',
	w => 'weekly',
	m => 'monthly',
);

my $fmt = '%Y-%m-%d';

my $scale = shift or usage();
my $full_scale = $full{$scale} or usage();

my $dater = Statbox::DateFactory::Today($scale);

my $from = shift or usage();
my $end = shift() || $from;

for ($from, $end) {
	/^\d{4}-\d{2}-\d{2}$/ or usage();
}

$from = $dater->from_string($from, $fmt)->as_string($fmt);
$end = $dater->from_string($end, $fmt)->next(1)->clone('d')->as_string($fmt);


while ( $from lt $end ) {
	my @days;
	my $dayer = Statbox::DateFactory::Today('d');
	my $beg = $dayer->from_string($from, $fmt)->as_string($fmt);
	my $end = $dayer->clone($scale)->next(1)->as_string($fmt);
	while ( $beg lt $end ) {
		push @days, $beg;
		$beg = $dayer->next(1)->as_string($fmt);
	}
	my $str = "./job --var scale=$full_scale --var from_date=$days[0] --var to_date=$days[-1]";
	!system($str)
		or die "couldn't exec '$str'";
	$from = $end;
}

