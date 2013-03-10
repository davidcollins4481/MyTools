use strict;
use warnings;
use Getopt::Long;

my $format_string;
my $args = GetOptions ("string=s" => \$format_string);

open (WIRELESS, "</proc/net/wireless");
my @wireless = <WIRELESS>;
close WIRELESS;

my $stat_line = $wireless[-1];
# clean up to parse
$stat_line =~ s/:|\.//g;
$stat_line =~ s/\s{2,}/ /g;
$stat_line =~ s/^\s+//g;

# only support space-delimited for now
# %i = interface name
# %l = link quality
# %s = signal strength
# %n = noise
my %output;
($output{'%i'}, undef, $output{'%l'}, $output{'%s'}, $output{'%n'}) 
    = split(/\s/, $stat_line);

if ($format_string) {
   my @options = split(/\s/, $format_string);
   print join " ", @output{@options};
}


__END__

Author: David Collins <davidcollin4481@gmail.com>
GPLv2 - do whatever with it

Inter-| sta-|   Quality        |   Discarded packets               | Missed | WE
 face | tus | link level noise |  nwid  crypt   frag  retry   misc | beacon | 22
  wlan0: 0000   80.   44.    0.       0      0      0      0      0        0

