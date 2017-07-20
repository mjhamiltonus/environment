#!/usr/bin/perl

# Convert netscape mail to Evolution mail.
# Unfortunately, after all this work, you actually still 
# need to create all the folders by hand before you run this script.

use FileHandle;

$netscapeDir = "/home/mikeh/netm";
# $evolutionDir = "/home/mikeh/evolution/local";
$evolutionDir = "/home/mikeh/bin/temp";
$verbose = 1;

# Sadly, Evolution handles the top level directory differently from the 
# subdirectories, so, we can't just jump right into the recursive call.

# open the new directory in the tree
opendir NETDIR, $netscapeDir
    or die "Couldn't open $netscapeDir in Mozilla area";

# Find the list of subdirectories, no "subfolders" dir for top level
@subdirs = grep /\.sbd$/, readdir NETDIR;

#--- Create the subdirecotory tree in Evolution ---
foreach $subdir (@subdirs) {
    $_ = $subdir;
    /(.*).sbd/;
    $name = $1;
  
    print;
    print "\n";
    print "$name\n";

    # New Subdirectory names
    $newRecNetDir = $netscapeDir . "/" . $_;
    $newRecEvoDir = $evolutionDir . "/$name";
  
    # START RECURSION CALL
    # Make the new Evolution directory and populate based on Netscape
    mkdir $newRecEvoDir;
    populateDir( $newRecNetDir, $newRecEvoDir );
}

#--- Populate the mailboxes ---
rewinddir NETDIR;
# Get the .msf names
@mailboxes = grep /\.msf$/, readdir NETDIR;
if( $verbose ) {
    print "Processing mailboxes: @mailboxes\n";
}
# Build the directory and copy over the mbox file    
foreach $mailbox (@mailboxes) {
    $_ = $mailbox;
    /(.*).msf/;
    $name = $1;
    # make the Evolution directory
    $newEvoDir = $evolutionDir . "/$name";
    if( ! -d $newEvoDir ) { 
	mkdir $newEvoDir; 
    }
    # copy the data to the Evolution mbox file 
    $netscapeMail = "$netscapeDir/$name";
    $netscapeMail =~ s/[ ]/\\ /g;
    $evoMail = "$newEvoDir/mbox";
    $evoMail =~ s/[ ]/\\ /g;
    $cmd = "cp $netscapeMail $evoMail";
    `$cmd`;
}




# Go down into the tree and create the directory structure for Evolution
sub populateDir {
    my ($recNetDir,$recEvoDir) = @_;
    my @subdirs, $subdir, $name;
    my $NETDIR = new FileHandle;

    if( $verbose ) {
	print "processing $recNetDir...\n";
    }

    # open the new directory in the tree
    opendir $NETDIR, $recNetDir
	or die "Couldn't open $dirname in Mozilla area";

    # Find the list of subdirectories, and create the "subfolders" dir in Evolution
    @subdirs = grep /\.sbd$/, readdir $NETDIR;
    if( $#subdirs > 0 ) {
	mkdir $recEvoDir . "/subfolders";
    }

    # Create the Folders in Evolution, populate the mbox files
    foreach $subdir (@subdirs) {
	$_ = $subdir;
	/(.*).sbd/;
	$name = $1;

	print;
	print "\n";
	print "$name\n";
	
	# New Subdirectory names
	$newRecNetDir = $recNetDir . "/" . $_;
	$newRecEvoDir = $recEvoDir . "/subfolders/$name";

	# RECURSION CALL
	# Make the new Evolution directory and populate based on Netscape
	mkdir $newRecEvoDir;
	populateDir( $newRecNetDir, $newRecEvoDir );
    }

    # Populate the data files
    rewinddir $NETDIR;
    # Get the .msf names
    @mailboxes = grep /\.msf$/, readdir $NETDIR;
    if( $#mailboxes > 0 ) {
	if (! -d mkdir ($recEvoDir . "/subfolders")) {
	    mkdir $recEvoDir . "/subfolders";
	}
    }

    if( $verbose ) {
	print "Processing mailboxes: @mailboxes\n";
    }
    
    foreach $mailbox (@mailboxes) {
	$_ = $mailbox;
	/(.*).msf/;
	$name = $1;

	# make the Evolution directory
	mkdir $recEvoDir . "/subfolders/$name";
	# copy the data to the Evolution mbox file 
	$netscapeMail = "$recNetDir/$name";
	$evoMail = "$recEvoDir/subfolders/$name/mbox";
	$netscapeMail =~ s/[ ]/\\ /g;
	$evoMail =~ s/[ ]/\\ /g;
	$cmd = "cp $netscapeMail $evoMail";
	print "$cmd\n";
	`$cmd`;
    }

    close $NETDIR;

}




