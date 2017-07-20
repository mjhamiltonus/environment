#!/usr/bin/perl
# filename: replace.pl
# Mike Hamilton
# MPL/SIO   date: 2002-12-13
# Description:
#   replace something in a set of filenames

#-----Get filename-----
$mydir = ".";
opendir THISDIR, $mydir;
@filelist = grep /\.xml/, readdir THISDIR;


foreach  $file  (@filelist) {
    chomp $file;

    $file;
    
    $newfile = "../moos-test-run-format/$file";

    $cmd = "xmllint -format $file >  $newfile";

    print "$cmd \n";

    `$cmd`;
}    

