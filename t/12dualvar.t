#!perl

use strict;
use warnings;
use Test::More;
use lib 't';

=head1 NAME

12dualvar.t - Tests we dualvar @DB::dbline;
triggered

=over

=cut


BEGIN {
use_ok( 'Enbugger' );
}

my $eval_string='
# Comment
$x = 1;
$y = 2;
';

my @eval_ary = Enbugger::dualvar_lines($eval_string, 0, 1);
my @eval_string = ("\n", split("\n", $eval_string));
my $have_codelines = eval{ require B::CodeLines; 1};
my @expect_num = $have_codelines ? 
  ('', '', '', 1, 1) : ('', '', '', '', '');
my @expect_str = map "$_\n", split(/\n/, $eval_string);
foreach (my $i=1; $i < scalar(@eval_ary); $i++) {
    is(0 != $eval_ary[$i], $expect_num[$i], "Breakpoint match on $i");
    is($eval_string[$i] . "\n", $eval_ary[$i], "line match on $i");
}

done_testing();
## Local Variables:
## mode: cperl
## mode: auto-fill
## cperl-indent-level: 4
## End:
