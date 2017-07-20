#!/usr/bin/perl 

($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst)=localtime(time);
$tstamp=sprintf("%4d-%02d-%02d_%02d:%02d:%02d\n",$year+1900,$mon+1,$mday,$hour,$min,$sec);

$cmd = "rsync -e ssh -avz --exclude-from=/home/hamilton/bin/backup_exclude --delete-excluded /home/hamilton/ freedom:hamiltonlinux  > /home/hamilton/movelog/backup_hamiltonlinux_log.$tstamp";

print $cmd;
`$cmd`;

# copy the backup log post-mortem
$cmd = "rsync -e ssh -avz  /home/hamilton/movelog/backup_hamiltonlinux_log.$tstamp  freedom:movelog/";
print $cmd;
`$cmd`;



