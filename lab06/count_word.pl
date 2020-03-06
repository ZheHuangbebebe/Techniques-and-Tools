#!/usr/bin/perl -w

sub count_words{
	my ($word) = @_;
	while ($str = <STDIN>){
		push @lines, $str;
	}
	$count = 0;
	foreach $line(@lines){
		@words = split(/[^a-zA-Z]/, $line);
		foreach $w(@words){
			if((uc($w) cmp uc("$word")) == 0){
				$count = $count + 1;
			}
		}
	}
	return $count;
}

$count = count_words($ARGV[0]);

print "$ARGV[0] occurred $count times\n";
