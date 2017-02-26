#!/usr/bin/env perl

use warnings;
use strict;

my $list = $ARGV[0] || 'ID.txt';
my $data = $ARGV[1] || 'DB.fas';
my $outs = $ARGV[2] || 'SQ.fas';


my @list = ();
open (LIST,$list) or die "Cannot open file $list: $!\n";
while (my $id = <LIST>) {
	chomp $id;
	$id =~ s/\s//g;
 	push @list, $id
}
close LIST;

my %seq = ();
my $sid = ();
open (IN, $data) or die "Cannot open file $data: $!\n";;
while (<IN>) {
	if (/^\>(\S+)/) {
		$sid = $1;
	} else {
		$seq{$sid} .= $_;
	}
}
close IN;

open (OUT, ">$outs") or die "Cannot create file $outs: $!\n";
foreach my $id (@list) {
	next unless (exists $seq{$id});
	print OUT ">$id\n";
	print OUT $seq{"$id"};
}
close OUT;
