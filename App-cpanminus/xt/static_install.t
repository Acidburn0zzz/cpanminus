use strict;
use Test::More;
use lib ".";
use xt::Run;

run_L '--no-uninst-shadows', 'Acme::Pi';
unlike last_build_log, qr/installed Module-Build-Tiny/;
like last_build_log, qr/Distribution opts in x_static_install/;

run_L '--no-uninst-shadows', '--no-notest', 'CPAN::Test::Dummy::Perl5::StaticInstall';
like last_build_log, qr/Checking if you have TAP::Harness::Env/;
like last_build_log, qr/Distribution opts in x_static_install/;

done_testing;

