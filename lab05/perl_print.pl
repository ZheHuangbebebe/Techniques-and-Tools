#!/usr/bin/perl -w

$s = change_string($ARGV[0]);
print "print\"$s\\n\";";

sub change_string{
	$new = "";
	my ($string) = @_;
	foreach $c(split //, $string){
		if($c =~ /[\'\"\.\\\n]/){
			$c = "\\$c";		
		}
		$new = "$new$c";
	} 
	return $new;
}

