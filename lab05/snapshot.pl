#!/usr/bin/perl -w

sub save{
	$num = 0;
	while (-e ".snapshot.$num"){
		$num = $num + 1;
	}
	mkdir ".snapshot.$num";
	print "Creating snapshot $num\n";
	foreach $file(glob("*")){
		if ($file =~ /^[.]/){
			next;
		}
		if ($file =~ /snapshot.pl/){
			next;
		}
		open $r, '<', $file;
		open $w, '>', ".snapshot.$num/$file";
		print $w (<$r>);
		close $r;
		close $w;
	}
}

sub load{
	my ($n) = @_;
	save();
	@f = glob(".snapshot.$n/*");
	foreach $file(@f){
		@local = split /\//, $file;
		if( -e $local[1]){
			unlink ($local[1]);
		}
		open $r, '<', $file;
		open $w, '>', "$local[1]";
		print $w (<$r>);
		close $r;
		close $w;
	}
	print"Restoring snapshot $n\n";
}


if (($ARGV[0] cmp "save") == 0){
	save();
}
if (($ARGV[0] cmp "load") == 0){
	load($ARGV[1]);
}
