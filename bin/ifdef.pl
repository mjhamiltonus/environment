#!/usr/local/bin/perl
# filename: ifdef.pl
# Mike Hamilton
# Orincon   date: 2000-99-99
# Description:
#   find all the unique ifdefs in c files in this directory

opendir THISDIR, ".";
@allfiles = grep /\.c$/, readdir THISDIR;

# @allfiles = ("WET_RC_report_updates.c", "WET_RC_input_interface.c" );

@alldefs = ();

while( <@allfiles> ) {
#    print "$_\n";

    open INFILE, '<'.$_ or 
	die "File $_ didn't open ";
    while( <INFILE> ) {
	#----- This pattern matched #ifdef XXX and #if defined( XXX -----
	if( ($dummy,$def) = /^#if\s*def(ined\()*\s*(\w*)/  ) {
	   $found = 0;
	   #--- check, add if don't have already ---
	   foreach $ff (@alldefs) {
	       if( $def eq $ff ) {
		   $found = 1;
		   break;
	       }
	   }
	   if( ! $found ) {
	       push @alldefs, $def;
	   }	      
       }
	#----- This pattern matches #if defined(XX) || defined(XX) -----
	#----- and returns the second defined -----
	if( ($def) = /^#if.*\|\|.*defined\((\w+)/ ) {
	   $found = 0;
	   #--- check, add if don't have already ---
	   foreach $ff (@alldefs) {
	       if( $def eq $ff ) {
		   $found = 1;
		   break;
	       }
	   }
	   if( ! $found ) {
	       push @alldefs, $def;
	   }	      
       }
    } # Done with file
} # Done with all files

foreach $ff (@alldefs) {
    printf( "$ff\n" );
}







