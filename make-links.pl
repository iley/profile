#!/usr/bin/perl -wl
use strict;
use Cwd qw(abs_path);
use File::Basename qw(dirname);
use File::Path qw(make_path);

my %files = (
    'ssh/config' => '.ssh/config',
    ( map { ( $_ => $_ ) } qw(bin lib) ),
    ( map { ( $_ => ".$_" ) }
            qw(gitconfig screenrc vim vimrc zshrc racketrc mplayer bashrc screen perldb oh-my-zsh inputrc sbclrc scmbrc emacs emacs.d perltidyrc tmux.conf)
    ),
	'qtile' => '.config/qtile',
);

my $home = $ENV{HOME};

my $profile = abs_path( dirname($0) );

while ( my ( $src, $dst ) = each(%files) ) {
    unless ( -e "$home/$dst" ) {
        make_path( dirname($dst) );
        print("symlink $profile/$src => $home/$dst");
        symlink( "$profile/$src", "$home/$dst" );
    }

    make_path("$home/.screen") unless -e "$home/.screen";
}
