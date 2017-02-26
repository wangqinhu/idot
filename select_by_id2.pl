#!/usr/bin/env perl

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
	my $id = load_table($file1);
	my $table = load_table($file2);
	choose($id, $table, $file3);
	return 1;
}

sub load_table {
	my ($file, $delim, $id_col) = @_;
	my %hash = ();
	open (IN, $file) or die "Cannot open $file: $!\n";
	while (<IN>) {
		chomp;
		next if /^#/;
		my @words = split /\t/;
		$hash{$words[0] . "\t". $words[1]} = $_;
	}
	close IN;
	return \%hash;
}

sub choose {
	my ($id, $table, $file) = @_;
	open (OUT, ">$file") or die "Cannot open $file: $!\n";
	foreach my $key (sort keys %{$id}) {
		if (exists $table->{$key}) {
			print OUT $table->{$key}, "\n";
		}
	}
	close OUT;
	return 1;
}
