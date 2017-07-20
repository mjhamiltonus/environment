#!/usr/bin/perl
# filename: replace.pl
# Mike Hamilton
# MPL/SIO   date: 2002-12-13
# Description:
#   replace something in a set of filenames

#-----Get filename-----
$mydir = ".";
opendir THISDIR, $mydir;
@filelist = grep /\.wav/, readdir THISDIR;


foreach  $file  (@filelist) {
    chomp $file;

    $oldfile = $file;
    $cmd = "mv $oldfile sfx.agg\+$file";

    print "$cmd \n";
    `$cmd`;
}    

