#!/usr/bin/perl -w
$num = 0;
foreach $arg (@ARGV) {
    if ($arg eq "--version") {
        print "$0: version 0.1\n";
        exit 0;
	}
    elsif ($arg =~ /-[0-9]+/){
		$num = abs($arg);
	}
    else {
        push @files, $arg;
    }
}
$n = @files;
if($n == 0){
	$f = <>;
	while ($f = <>){
		print "$f";
	}
}

foreach $file (@files) {
    open F, '<', $file or die "$0: Can't open $file: $!\n";
	if ($n>1){
		print "==> $file <==\n";
	}
 	 if ($num eq 0){
		print `cat "$file" | tail`;
	}
	else{
    	print `cat "$file" | tail -$num`;
	}
    close F;

}
