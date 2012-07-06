#!/usr/bin/perl -wl
use strict;
use Cwd;

my $libdir = $ARGV[0] or die "not enough args";
my $dir = getcwd();

my ($git_root, $last_rev);
chomp($git_root = `git rev-parse --show-toplevel`) or die 'could not find git root';
chomp($last_rev = `git log --pretty=%H . | head -1`) or die 'could not find latest revision';

chdir $git_root;
system("git archive ${last_rev}:$libdir > $dir/lib.tar") == 0 or die "could not create arhive for '$libdir' from revision $last_rev";
