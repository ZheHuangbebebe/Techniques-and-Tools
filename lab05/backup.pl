#!/usr/bin/perl -w

$num = 0;

while (-e ".$ARGV[0].$num"){
	$num = $num + 1;
}

open $r, '<', $ARGV[0];
open $w, '>', ".$ARGV[0].$num";
print $w (<$r>);
close $r;
close $w;

print"Backup of 'n.txt' saved as '.$ARGV[0].$num'\n";
