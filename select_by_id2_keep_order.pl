#!/usr/bin/env perl
#
# usage: select_by_id2_keep_order.pl id.tsv target.tsv output.xls
#

use strict;
use warnings;

# input and output settings
# id file
my $file1 = $ARGV[0] || "id.tsv";
# target file
my $file2 = $ARGV[1] || "target.tsv";
# output file
my $output_file = $ARGV[2] || "output.xls";

# main
select_by_id2($file1, $file2, $output_file);

# subroutines
sub select_by_id2 {
	my ($file1, $file2, $file3) = @_;
	my ($oder1, $table1, $n1) = load_table($file1);
	my ($oder2, $table2, $n2) = load_table($file2);
	choose($oder1, $table2, $file3, $n2);
	return 1;
}

sub load_table {
	# yet to implement: delim and id_col
	my ($file, $delim, $id_col) = @_;
	my @order = ();
	my $i = 0;
	my %hash = ();
	open (IN, $file) or die "Cannot open $file: $!\n";
	while (<IN>) {
		chomp;
		next if /^#/;
		my @words = split /\t/;
		my $id = $words[0] . "\t". $words[1];
		$order[++$i] = $id;
		$hash{$id} = $_;
	}
	my $fnum = (split /\t/, $hash{$order[$i]}) - 2; 
	close IN;
	return (\@order, \%hash, $fnum);
}

sub choose {
	my ($order, $table, $file, $num) = @_;
	open (OUT, ">$file") or die "Cannot open $file: $!\n";
	my $len = @{$order} - 1;
	foreach my $i (0..$len) {
		my $id = $order->[$i];
		next unless (defined($id));
		next unless ($id =~ /\S+\t\S+/);
		if (exists $table->{$id}) {
			print OUT $table->{$id}, "\n";
		} else {
			print OUT $id, "\t-" x $num, "\n";
		}
	}
	close OUT;
	return 1;
}
