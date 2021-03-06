#!/usr/bin/perl
# filename: replace.pl
# Mike Hamilton
# NURN   date: 2008-08-30
# Description:
#  Update the date in my headers
 
#-----Get filename-----
# @filelist = `find . -name CVS -print`;

$mydir = "/home/hamiltonmj/headers";
opendir THISDIR, $mydir;
@filelist = grep /header/, readdir THISDIR;

print @filelist;

($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst)=localtime(time);
$tstamp=sprintf("%4d-%02d-%02d",$year+1900,$mon+1,$mday);



foreach  $file  (@filelist) {
    chomp $file;
    $file = "$mydir/$file";
#    print "$file\n";

    #-----Get the data from the file-----
    open INPUT, "<" . $file or
         die "file $file doesn't exist\n";
    $size = (-s $file);
    read INPUT, $data, $size;
    close INPUT;

    #-----Replace-----
    $data =~ s/\d{4}-\d{2}-\d{2}/$tstamp/g;

    #-----Write the file out again-----
    open OUTPUT, ">" . $file;
    print OUTPUT $data ;
    close OUTPUT;
}

exit;
