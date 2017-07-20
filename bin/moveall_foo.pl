#!/usr/bin/perl

($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst)=localtime(time);
$tstamp=sprintf("%4d-%02d-%02d_%02d:%02d:%02d\n",$year+1900,$mon+1,$mday,$hour,$min,$sec);

$cmd = "rsync -P -z -e \"ssh -l hamiltonmich\" -avz --exclude-from=/home/hamilton/bin/backup_exclude_nadtop --delete-excluded 76.176.156.177:~/foo ~/nadtop > /home/hamilton/backup/backup_log.$tstamp";

print $cmd;
`$cmd`;



