#!/usr/bin/env perl
use strict;
use Google::Voice;
use YAML qw(LoadFile);
use Getopt::Long;
use MIME::Base64;

# Google::Voice is spitting out all kinds of stuff...don't want to see it
BEGIN { $SIG{'__WARN__'} = sub { return; } }

my $to_phone;
my $to_msg;

GetOptions (
    "number=s" => \$to_phone,
    "message=s"   => \$to_msg,
);

usage() if !$to_phone || !$to_msg;

# FIXME use FindBin for this path
my $config = LoadFile('bin/config.yaml');
my $gv;

$gv = Google::Voice->new->login(
    $$config{google_username},
    decode_base64($$config{google_password}),
);

# Send sms
$gv->send_sms($to_phone => $to_msg);

sub usage {
    print qq{Usage: sms_notify.pl -n xxxyyyzzzz -m "sms message text"\n};
    exit 1;
}
