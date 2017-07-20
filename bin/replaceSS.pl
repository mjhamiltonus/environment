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
@filelist = 
(
    "./CASW10ET/template/oex/simulation/plugs/pNull.plug",
    "./CASW10ET/20100414Kevin/oex2/simulation/plugs/pNull.plug",
    "./CASW10ET/20100414Kevin/oex/simulation/plugs/pNull.plug",
    "./CASW10ET/20100414Steph/oex/simulation/plugs/pNull.plug",
    "./CASW10ET/bhvStephDEMUS/oex/simulation/plugs/pNull.plug",
    "./CASW10ET/20100415Kevin/oex2/simulation/plugs/pNull.plug",
    "./CASW10ET/20100415Kevin/oex/simulation/plugs/pNull.plug",
    "./CASW10ET/20100412Steph/oex/simulation/plugs/pNull.plug",
    "./multivehicle/oex2/simulation/plugs/pNull.plug",
    "./multivehicle/oex/simulation/plugs/pNull.plug",
    "./template/oex/simulation/plugs/pNull.plug",
    "./kemna/debugCASW10ET/oex/simulation/plugs/pNull.plug",
    "./kemna/testMovingTarget/oex/simulation/plugs/pNull.plug",
    "./kemna/testMinLocErr/oex/simulation/plugs/pNull.plug",
    "./GLINT09/template/oex/simulation/plugs/pNull.plug"
);


foreach  $file  (@filelist) 
{
    chomp $file;
    print $file;
    print "\n";

    #-----Get the data from the file-----
    open INPUT, "<" . $file or
        die "file $file doesn't exist\n";
    $size = (-s $file);
    read INPUT, $data, $size;
    close INPUT;

    #-----Replace-----
    $data =~ s/SOUND_SPEED = 1500/SOUND_SPEED = _SOUND_SPEED/g;

    #-----Write the file out again-----
    open OUTPUT, ">" . $file;
    print OUTPUT $data ;
    close OUTPUT;
}

exit;
