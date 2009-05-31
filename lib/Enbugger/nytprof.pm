package Enbugger::NYTProf;

# COPYRIGHT AND LICENCE
#
# Copyright (C) 2007,2009 WhitePages.com, Inc. with primary
# development by Joshua ben Jore.
#
# This program is distributed WITHOUT ANY WARRANTY, including but not
# limited to the implied warranties of merchantability or fitness for
# a particular purpose.
#
# The program is free software.  You may distribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation (either version 2 or any later version)
# and the Perl Artistic License as published by O’Reilly Media, Inc.
# Please open the files named gpl-2.0.txt and Artistic for a copy of
# these licenses.


=head1 NAME

Enbugger::NYTProf - subclass for Devel::NYTProf profiler

=cut


use strict;
use warnings;
use vars qw( @ISA @Symbols );
BEGIN { @ISA = 'Enbugger' }




=head1 OVERRIDEN METHODS

=over

=item CLASS-E<gt>_load_debugger

=cut

sub _load_debugger {
    my ( $class ) = @_;
    
    Enbugger::_compile_with_nextstate();
    require Devel::NYTProf;
    Enbugger::_compile_with_dbstate();
    
    $class->init_debugger;
    
    return;
}





=item CLASS-E<gt>_stop

=cut

sub _stop;







=back

=cut




# Load up a list of symbols known to be associated with this
# debugger. Enbugger, the base class will use this to guess at which
# debugger has been loaded if it was loaded prior to Enbugger being
# around.
while ( my $line = <DATA> ) {
    $line =~ s/[\r\n]+\z//;

    # Stop reading once I hit the paragraph of at the end.
    last if not $line;

    push @{$Enbugger::RegisteredDebuggers{NYTProf}{symbols}}, $line;
}
close *DATA;

() = -.0

__DATA__
DB
DB_profiler
_INIT
__ANON__[/opt/perl-5.10.0/lib/site_perl/5.10.0/darwin-2level/Devel/NYTProf.pm:39]
_finish
args
dbline
disable_profile
enable_profile
finish_profile
init_profiler
postponed
set_option
signal
single
sub
trace

## Local Variables:
## mode: cperl
## mode: auto-fill
## cperl-indent-level: 4
## End:
