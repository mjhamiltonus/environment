#!/usr/bin/perl
# filename: 
# Mike Hamilton
# Orincon   date: 2000-
# Description:
#   Path Checker

@dirs = split /:/, $ENV{PATH};

print $dirs[2];
print "\n";

$newpath = "";
$error = 0;
foreach $dir (@dirs) {
	print "Checking $dir\n";
	$data = `ls -d $dir` ;
	if ($? == 0) {
	    $newpath = $newpath . " " . $dir;
	} else {
	    $badpath = $badpath . " " . $dir . "\n";
	    $error = 1;
	}
}

if( $error ) {
    print "the following paths were not found: \n$badpath";
    print "A better path would be: \n\n";
    print $newpath;
    print "\n\n";
} else {
    print "All dirs in your path exist.\n";
}
    
