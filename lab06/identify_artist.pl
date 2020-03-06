#!/usr/bin/perl -w

foreach $argv (@ARGV){
	@lines = ();
	@cmp = ();
	open $r, '<', $argv;
	while ($str = <$r>){
		push @lines, $str;
	}
	foreach $line(@lines){
		@words = split(/[^a-zA-Z]/, $line);
		foreach $w(@words){
			if(($w cmp "") != 0){
				push @cmp, $w
			}
		}
	}
	close $r;
	$i = 0;
	foreach $file (glob "lyrics/*.txt") {
		open $ff, '<', $file or die "111";
		$file_content = do { local $/; <$ff> };
		$log = 0;
		@words = split(/[^a-zA-Z]/, $file_content);
		@words2 = grep { $_ ne '' } @words;
		$t = @words2;
		foreach $c(@cmp){
			@words1 = grep { uc($_) eq uc("$c") } @words;
			$co = @words1;
			$count = ($co+1)/$t;
			$log = $log + log($count);
		}
		@f = split(/[\/\.]/,$file);
		$f[1] =~ s/\_/ /g;
		$logs[$i] = $log;
		$names[$i] = $f[1];
		$i++;
		close $ff;
	}
	$max = $logs[0];
	$name = $names[0];
	for ($num = 0; $num < $i; $num ++){
		if ($max < $logs[$num]){
			$max = 	$logs[$num];
			$name = $names[$num];
		}
	}
	printf("%s most resembles the work of %s (log-probability=%.1f)\n", $argv, $name, $max);
}
	
