#use warnings;
use strict;
use Google::Voice;
use YAML qw(LoadFile);
use Getopt::Long;

# Google::Voice is spitting out all kinds of stuff...don't want to see it
BEGIN { $SIG{'__WARN__'} = sub { return; } }

my $to_phone;
my $to_msg;

GetOptions (
    "to=s" => \$to_phone,
    "message=s"   => \$to_msg,
);

usage() if !$to_phone || !$to_msg;

my $config = LoadFile('bin/config.yaml');
my $gv;

$gv = Google::Voice->new->login(
    $$config{google_username},
    $$config{google_password}
);

# Send sms
$gv->send_sms($to_phone => $to_msg);

sub usage {
    print qq{Usage: sms_notify.pl -t xxxyyyzzzz -m "sms message text"\n};
    exit 1;
}