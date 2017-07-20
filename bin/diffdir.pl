#!/usr/local/bin/perl
# filename: diffdir
# Mike Hamilton
# Orincon   date: 2000-02-15
# Description:
#


print @ARGV;
$mydir = $ARGV[0];

opendir THISDIR, $mydir;
#@allfiles = grep /\.pin/, readdir THISDIR;
@allfiles = grep /\.c/, readdir THISDIR;
while( <@allfiles> ) {
    $com = "diff tc/$_ $_";
    print "$com\n";
    $output = `$com`;
    print $output;
}


