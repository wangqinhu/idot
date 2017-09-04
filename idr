#!/usr/bin/env perl
#===============================================================================
#
# Description: ID replacement
#
# Copyright (c) 2017 Northwest A&F University
# Author: Qinhu Wang
# Email: wangqinhu@nwafu.edu.cn
#
#===============================================================================

use strict;
use warnings;
use Data::Dumper;

my $id_list = $ARGV[0] || 'old_new.txt';
my $in_file = $ARGV[1] || 'data.tsv';

my $hash = load_tsv($id_list);
my $line = '';

open (IN, $in_file) or die "Cannot open $in_file: $!\n";
while (<IN>) {
	chomp;
	next if (/^#/);
	my @w = split /\t/;	
	if (!exists $hash->{$w[0]}) {
		die "Aborted: No $w[0] found in $id_list.\n";
	}
	$w[0] = $hash->{$w[0]};
	$line = join ("\t", @w);
	print $line, "\n";

}
close IN;

sub load_tsv {
	my $file = shift;
	my %hash = ();
	open (IN, $file) or die $!;
	while (<IN>) {
		chomp;
		next if /^\#/;
		next if /^\s*$/;
		my @w = split /\s/;
		$hash{$w[0]} = $w[1];
	}
	close IN;
	return \%hash;
}
