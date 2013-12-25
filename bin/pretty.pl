#!/usr/bin/perl
use warnings;
use strict;
use JSON;
use IO::File;
use Data::Format::Pretty::JSON qw(format_pretty);

my $fh = IO::File->new( $ARGV[0] );
my $ref = decode_json( join '', $fh->getlines );
print format_pretty($ref);
