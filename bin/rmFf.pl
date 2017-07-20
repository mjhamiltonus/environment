#!/usr/bin/perl
# filename: rmFf
# Mike Hamilton
# MPL/SIO   date: 2002-12-13
# Description:
#   remove f files created from F files 

#-----Get filename-----
# Files which start with a letter (non-.)
$mydir = ".";
opendir THISDIR, $mydir;
@filelist = grep /^\w.+\.F/, readdir THISDIR;

foreach  $file  (@filelist) {
    ($root) = ($file =~ /(.*)\.F/);

    if( -e "$root.f" ) {
        $cmd = "rm $root.f";
        print "$cmd\n";
        `$cmd`;
    }
}

