#!/usr/bin/perl -w

use strict;

my $verbosity = 0;
my $in = 0;
my $err = 0;
sub checkHref {
	(my $href) = @_;	
	if ($href =~ /^https?:\/\//) {
			if ($verbosity) {
				printf "%-80s ?\n","$href";	
			}
	}
	else {
		if ($href =~ /^mailto/ || $href =~ /^#/) {
			if ($verbosity) {
				printf "%-80s -\n","$href";
			}
		}elsif (!localOk($href)) {
			printf "%-80s KO\n","$href";
			$err = 1;
		}
		elsif ($verbosity){
			printf "%-80s OK\n","$href";			
		}
	}	
}

if ($ARGV[0] eq "-v") {
	$verbosity = 1;
	$in++;

}

sub localOk() {
	(my $v) = @_;
	return -e $v;
}

open(my $FP, $ARGV[$in]) or die("Unable to ".$ARGV[$in]);
while (my $line = <$FP>) {
	my $src;
	my $href;
	if (($src) = $line =~ /src="([^"]+)"/) {		
		checkHref($src);
	} elsif (($href) = $line =~ /href="([^"]+)"/) {
		checkHref($href);		
	}
}
close $FP;
exit($err);