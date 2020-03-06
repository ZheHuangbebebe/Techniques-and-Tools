#!/usr/bin/perl -w
use Scalar::Util qw(looks_like_number);

if($#ARGV == 1){
	$num = "$ARGV[0]";
	$str = "$ARGV[1]";
	if (! looks_like_number($num)){
		print "./echon.pl: argument 1 must be a non-negative integer\n";
		exit;
	}
	else{
		if ($num < 0){
			print "./echon.pl: argument 1 must be a non-negative integer\n";
			exit;
		}
	}
	for ($i =0; $i < $num; $i++){
		print "$str\n";
	}
}
else{
	print "Usage: ./echon.pl <number of lines> <string>\n";
	exit;
}




