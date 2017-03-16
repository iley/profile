use strict;
use warnings;

use Irssi;

our $VERSION = '1.01';
our %IRSSI = (
    authors => 'Stefanus Du Toit',
    contact => 'stefanus@google.com',
    name => 'Comlink rewriter',
    description => 'Rewrites messages from comlink as if they came from the users',
    license => 'Google proprietary'
);

sub on_public_msg() {
    my ($server, $msg, $nick, $address, $target) = @_;

    return if $nick ne "comlink";

    my $action = 0;
    if ($msg =~ m/^<(\w+)> (.*)/ or ($msg =~ m/^\* (\w+) (.*)/ and $action = 1)) {
        my ($realnick, $realmsg) = ($1, $2);
        my $newnick = $realnick . '@comlink';

        if ($action) {
            Irssi::signal_emit("message irc action", $server, $realmsg, $newnick, $address, $target);
            Irssi::signal_stop();
        } else {
            Irssi::signal_continue($server, $realmsg, $newnick, $address, $target);
        }
    }
}

Irssi::signal_add_first 'message public', 'on_public_msg';
