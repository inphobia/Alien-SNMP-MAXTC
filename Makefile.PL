use strict;
use warnings;
use ExtUtils::MakeMaker;
use Alien::Build::MM;

my $abmm = Alien::Build::MM->new;

WriteMakefile($abmm->mm_args(
#	SIGN         => 1,
	ABSTRACT     => 'Alien wrapper for Net-SNMP',
	DISTNAME     => 'Alien-SNMP-MIBDEV',
	NAME         => 'Alien::SNMP::MIBDEV',
	VERSION_FROM => 'lib/Alien/SNMP/MIBDEV.pm',
	LICENSE      => 'bsd',
        AUTHOR       => [ 'Eric A. Miller <emiller AT cpan DOT org>',
                          'Oliver Gorwits <oliver AT cpan DOT org>',
                          'Nick Nauwelaerts <inphobia AT cpan DOT org>',
                        ],
	META_MERGE => {
		resources => {
			homepage => 'https://github.com/inphobia/Alien-SNMP-MIBDEV',
			bugtracker => 'https://github.com/inphobia/Alien-SNMP-MIBDEV/issues',
			repository  => 'https://github.com/inphobia/Alien-SNMP-MIBDEV',
			mailinglist => 'https://lists.sourceforge.net/lists/listinfo/snmp-info-users',
			irc => 'irc://irc.libera.chat/#netdisco',
		},
	},
));

sub MY::postamble {
  $abmm->mm_postamble(@_);
}

sub MY::install {
  $abmm->mm_install(@_);
}
