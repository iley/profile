#!/usr/bin/env perl

use strict;
use warnings;

use Cwd qw(abs_path);
use File::Basename qw(dirname);
use File::Path qw(make_path);

my @groups = (
    {
        prefix => '.',
        files => [
            'XCompose',
            'bashrc',
            'emacs',
            'emacs.d',
            'gitconfig',
            'inputrc',
            'mplayer',
            'oh-my-zsh',
            'perldb',
            'perltidyrc',
            'racketrc',
            'sbclrc',
            'screen',
            'screenrc',
            'ssh/config',
            'tmux.conf',
            'vim',
            'vimrc',
            'xinitrc',
            'zshrc',
        ]
    },
    {
        prefix => '.config/',
        files => [ 'qtile' ],
    },
    {
        files => [ 'bin', 'lib' ],
    }
);

my %files;

for my $group (@groups) {
    my $prefix = $group->{prefix} || '';
    for my $file (@{$group->{files}}) {
        $files{$file} = $prefix . $file;
    }
}

my $home = $ENV{HOME};

my $profile = abs_path( dirname($0) );

while ( my ( $src, $dst ) = each(%files) ) {
    unless ( -e "$home/$dst" ) {
        make_path( dirname($dst) );
        print("symlink $profile/$src => $home/$dst\n");
        symlink( "$profile/$src", "$home/$dst" );
    }

    make_path("$home/.screen") unless -e "$home/.screen";
}
