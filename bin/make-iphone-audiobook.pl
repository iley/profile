#!/usr/bin/perl -wl

sub execute($) {
    my $cmd = shift;
    print "executing '$cmd'";
    my $result = system($cmd);
    $? == 0 or die "could not execute '$cmd'";
    return $result;
}

sub assert_installed($) {
    my $cmd = shift;
    system("which $cmd") == 0 or die "$cmd not installed";
}

assert_installed($_) for qw(mp3wrap mplayer faac);

my ($dir, $author, $title, $year, $tmp) = @ARGV;
$year ||= '2011';
$tmp ||= "/tmp";
$dir && $author && $title && $year && $tmp or die "usage: $0 dir author title [year] [tmp]";


execute("mp3wrap '$tmp/book' '$dir'/*.mp3");

my $mplayer_log = "$tmp/mplayer.log";
execute("mplayer -vc null -vo null -ao pcm:nowaveheader:fast:file=$tmp/book.pcm $tmp/book_MP3WRAP.mp3 | tee $mplayer_log");
unlink "$tmp/book_MP3WRAP.mp3";

my ($rate, $chan, $bits);
open LOG, '<', $mplayer_log or die $!;;
while (<LOG>) {
    if (/^AO:\s+\[\w+\]\s+(\d+)Hz\s+(\d)ch\s+\w(\d+)/) {
        ($rate, $chan, $bits) = ($1, $2, $3);
        print "found mplayer format string: '$_'";
        print "rate=$rate, chan=$chan, bits=$bits";
    }
}
close $mplayer_log;
unlink $mplayer_log;

$rate && $chan && $bits or die "could not parse mplayer output";

my $out = 'book';
if (-e $out) {
    $out .= 1;
    while (-e $out) {
        ++$out;
    }
}

execute("faac -R $rate -B $bits -C $chan -X -w -q 80 --artist '$author' --album '' --title '$title' --track '1' --genre 'Spoken Word' --year '$year' -o $out.m4b $tmp/book.pcm");
unlink "$tmp/book.pcm";
print "book is saved as $out";
