#!/usr/bin/perl

while ($line = <STDIN>){
	for $i (0..length($line)-1){
		$char = substr($line, $i, 1);
		if ($char =~ /^[0-9]+$/){
			if ($char < 5){
				print "<"
			}
			elsif ($char > 5){
				print ">"
			}
			else {
				print "$char"
			}
		} 
		else{
			print "$char"
		}
	}
}

