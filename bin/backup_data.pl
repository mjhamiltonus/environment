#!/usr/bin/perl 

($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst)=localtime(time);
$tstamp=sprintf("%4d-%02d-%02d_%02d:%02d:%02d\n",$year+1900,$mon+1,$mday,$hour,$min,$sec);

$cmd = "rsync -e ssh -avz /home/data/ norfolk:/home/data/  > /home/hamilton/movelog/backup_data_log.$tstamp";

print $cmd;
`$cmd`;

# copy the backup log post-mortem
$cmd = "rsync -e ssh -avz   /home/hamilton/movelog/backup_data_log.$tstamp  norfolk:movelog/backup_data_log.$tstamp";
print $cmd;
`$cmd`;



