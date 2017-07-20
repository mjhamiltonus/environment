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
"./CASW10ET/20100409/oex/shared/default-overrides.def",
"./CASW10ET/20100406/oex/shared/default-overrides.def",
"./CASW10ET/20100413Joao/oex/shared/default-overrides.def",
"./CASW10ET/20100414JanusTxRx/oex/shared/default-overrides.def",
"./CASW10ET/20100415Groucho/oex/shared/default-overrides.def",
"./CASW10ET/20100414Triplet/oex/shared/default-overrides.def",
"./CASW10ET/20100410/oex/shared/default-overrides.def",
"./CASW10ET/20100414Kevin/oex2/shared/default-overrides.def",
"./CASW10ET/20100414Kevin/oex/shared/default-overrides.def",
"./CASW10ET/20100414Steph/oex/shared/default-overrides.def",
"./CASW10ET/bhvStephDEMUS/oex/shared/default-overrides.def",
"./CASW10ET/20100415Kevin/oex2/shared/default-overrides.def",
"./CASW10ET/20100415Kevin/oex/shared/default-overrides.def",
"./CASW10ET/20100412Steph/oex/shared/default-overrides.def",
"./CASW10ET/20100415Harpo/oex/shared/default-overrides.def",
"./CASW10ET/20100411Joao/oex/shared/default-overrides.def",
"./baralli/demo_slitaBB/demoBB/oex/shared/default-overrides.def",
"./baralli/demo_slitaBB/demo_multicomputer/oex/shared/default-overrides.def",
"./multivehicle/oex2/shared/default-overrides.def",
"./multivehicle/oex/shared/default-overrides.def",
"./demo/oex/shared/default-overrides.def",
"./hamilton/GLINT09_test/oex/simulation/default-overrides.def",
"./hamilton/demo_multicomputer/oex/shared/default-overrides.def",
"./hamilton/demo_dmht/oex/shared/default-overrides.def",
"./kemna/debugCASW10ET/oex/shared/default-overrides.def",
"./kemna/testMovingTarget/oex/shared/default-overrides.def",
"./kemna/testMovingTarget/oex/behaviour/default-overrides.def",
"./kemna/testActiveBroadside/oex/shared/default-overrides.def",
"./kemna/testMinLocErr/oex/shared/default-overrides.def",
"./kemna/GLINT09_test/oex/simulation/default-overrides.def",
"./kemna/GLINT09_test/oex/runtime/default-overrides.def",
"./GLINT09/20090713/oex/simulation/default-overrides.def",
"./GLINT09/20090713/oex/runtime/default-overrides.def",
"./GLINT09/20090712/oex/simulation/default-overrides.def",
"./GLINT09/20090712/oex/runtime/default-overrides.def",
"./GLINT09/20090715/oex/simulation/default-overrides.def",
"./GLINT09/20090715/oex/runtime/default-overrides.def",
"./GLINT09/20090714/oex/simulation/default-overrides.def",
"./GLINT09/20090714/oex/runtime/default-overrides.def",
"./GLINT09/20090716/oex/shared/default-overrides.def",
"./GLINT09/20090717/oex/shared/default-overrides.def"
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
    $data =~ s/SOUND_SPEED/_SOUND_SPEED/g;

    #-----Write the file out again-----
    open OUTPUT, ">" . $file;
    print OUTPUT $data ;
    close OUTPUT;
}

exit;
