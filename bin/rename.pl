#!/usr/bin/perl
# filename: replace.pl
# Mike Hamilton
# MPL/SIO   date: 2002-12-13
# Description:
#   replace something in a set of filenames

#-----Get filename-----
$mydir = ".";
opendir THISDIR, $mydir;
#@filelist = grep /\.pin/, readdir THISDIR;

$oldstring = 'pProcessSlitaBB';
$newstring = 'pDopplerSim';

@filelist = grep /$oldstring/, readdir THISDIR;

foreach  $file  (@filelist) {
    chomp $file;

    $oldfile = $file;
    $file =~ s/$oldstring/$newstring/;
    $cmd = "mv $oldfile $file";

    print "$cmd \n";

    `$cmd`;
}    

