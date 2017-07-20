#!/usr/bin/perl
# filename: replace.pl
# Mike Hamilton
# MPL/SIO   date: 2002-12-13
# Description:
#   Kill the ^M in a file

#-----Get filename-----
# @filelist = `find . -name "CVS" -print`;
# @filelist = `find . -name ".depends" -print`;
# @filelist = `find . -name "linuxobj" -print`;


foreach  $file  (@filelist) {
    chomp $file;

    $cmd = "\\rm -rf  $file";
    print "$cmd \n";
    `$cmd`;
}

exit;
