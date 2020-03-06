#!/usr/bin/perl -w

sub count_words{
	my ($file,$word) = @_;
	@lines = ();
	open $r, '<', $file;
	while ($str = <$r>){
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
	close $r;
	return $count;
}

sub total_words{
	my ($file) = @_;
	@lines = ();
	open $r, '<', $file;
	while ($str = <$r>){
		push @lines, $str;
	}
	$count = 0;
	foreach $line(@lines){
		@words = split(/[^a-zA-Z]/, $line);
		foreach $w(@words){
			if(($w cmp "") != 0){
				$count = $count + 1;
			}
		}
	}
	close $r;
	return $count;
}

foreach $file (glob "lyrics/*.txt") {
	$total = total_words($file);
	$count = count_words($file, $ARGV[0]);
	$countPlus1 = $count+1;
	@f = split(/[\/\.]/,$file);
	$f[1] =~ s/\_/ /g;
	printf("log((%d+1)/%6d) = %8.4f %s\n", $count, $total, log($countPlus1/$total), $f[1]);
}
