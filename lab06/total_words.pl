#!/usr/bin/perl -w

sub total_words{
	while ($str = <STDIN>){
		push @lines, $str;
	}
	$count = 0;
	foreach $line(@lines){
		@words = split(/[^a-zA-Z]/, $line);
		@words = grep { $_ ne '' } @words;
		$count = $count + @words;
	}
	return $count;
}

$count = total_words();
print "$count words\n";
