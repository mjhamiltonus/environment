#!/usr/bin/perl
# filename: replace.pl
# Mike Hamilton
# MPL/SIO   date: 2002-12-13
# Description:
#   Kill the ^M in a file

#-----Get filename-----
# @filelist = `find . -name CVS -print`;

# # Files which start with a letter (non-.)
# $mydir = ".";
opendir THISDIR, $mydir;
@filelist = grep /^\w/, readdir THISDIR;

foreach  $file  (@filelist) {
    chomp $file;
    $file = "$file/Root";

    #-----Get the data from the file-----
    open INPUT, "<" . $file or
        die "file $file doesn't exist\n";
    $size = (-s $file);
    read INPUT, $data, $size;
    close INPUT;

    #-----Replace-----
    $data =~ s/eldredge/mikeh/g;

    #-----Write the file out again-----
    open OUTPUT, ">" . $file;
    print OUTPUT $data ;
    close OUTPUT;
}

exit;
