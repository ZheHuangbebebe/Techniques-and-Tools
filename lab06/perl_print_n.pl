#!/usr/bin/perl -w

$n = $ARGV[0];
$s = change_string($ARGV[1]);
for($i = 0; $i < $n; $i ++){
	$s = n_times($s);
}
print"$s";

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

sub n_times{
	my ($str) = @_;
	return "print\"$str\\n\";"
}

