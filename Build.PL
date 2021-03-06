#!/usr/bin/env perl

use strict;
use warnings;
use 5.010001;
use utf8;

use lib 'inc';
use My::ModuleBuild;

my $conf_cmd = [
  '%c',                     '--with-pic',
  '--prefix=%s',            '--disable-agent',
  '--disable-scripts',      '--disable-mibs',
  '--enable-ipv6',          '--with-mibs=""',
  '--with-perl-modules',    '--disable-embedded-perl',
  '--disable-manuals',      '--with-defaults',
];

my %module_build_args = (
  alien_autoconf_with_pic => 0,
  alien_build_commands =>
    ["%x -I../../inc -MMy::AlienPatch -e alien_patch", $conf_cmd, 'make'],

  # Not using FFI, default_store library only dynamic and needed for XS
  alien_isolate_dynamic => 0,
  alien_name            => 'netsnmp',

  # Headers referenced as net-snmp/xxx.h, autodiscovery appends net-snmp
  alien_provides_cflags => '-I${pcfiledir}/include',
  alien_provides_libs   => '-lnetsnmp',
  alien_repository      => {
    protocol       => 'https',
    host           => 'github.com',
    location       => '/netdisco/upstream-sources/blob/master/net-snmp/',
    exact_filename => 'net-snmp-5.8.tar.gz?raw=true',
  },
  alien_stage_install => 0,
  build_requires      => {
    "Alien::Base"        => '0.020',
    "Software::License" => '0',
  },
  configure_requires  => {
    "perl"               => '5.010001',
    "Alien::Base::ModuleBuild" => '0',
    "File::ShareDir"     => '1.03',
    "Module::Build"      => '0.42',
    "PkgConfig"          => '0.14026',
    "Test2::Suite"       => '0.000067'
  },
  create_license    => 1,
  create_readme     => 1,
  dist_abstract     => 'Build and install Net-SNMP',
  dist_author       => [
    'Eric A. Miller <emiller AT cpan DOT org>',
    'Oliver Gorwits <oliver AT cpan DOT org>',
    'Nick Nauwelaerts <inphobia AT cpan DOT org>',
  ],
  dist_name         => 'Alien-SNMP-MIBDEV',
  dist_version_from => 'lib/Alien/SNMP/MIBDEV.pm',
  license           => 'bsd',
  module_name       => "Alien::SNMP::MIBDEV",
  release_status    => 'stable',
  recommends        => {},
  requires          => {
    "Alien::Base"    => '0.020',
    "File::ShareDir" => '1.03',
    "parent"         => '0',
    "perl"           => '5.010001',
  },
  test_requires => {
    "Test::Alien" => 0,
    "Test::More" => '0.94',
    "Test::Manifest" => '0.9',
    "perl" => '5.010001'
  },
  meta_merge => {
    resources => {
      repository => 'https://github.com/inphobia/Alien-SNMP-MIBDEV',
      bugtracker => 'https://github.com/inphobia/Alien-SNMP-MIBDEV/issues',
      MailingList => 'https://lists.sourceforge.net/lists/listinfo/snmp-info-users',
      IRC => 'irc://irc.libera.chat/#netdisco',
    },
  },
);

my $builder = My::ModuleBuild->new(%module_build_args);

$builder->create_build_script;
