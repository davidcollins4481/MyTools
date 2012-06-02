#!/usr/bin/perl -w

use XML::Tidy;

# config options
######################
my $indent_spaces = 4;
my $complete_message = "Tidying complete";
######################

my @files;
my $end_action;

if (nautilusContext()) {
    @files = split(" ", $ENV{'NAUTILUS_SCRIPT_SELECTED_FILE_PATHS'});
    $end_action = \&zenityNotifyFinished;
} else {
    @files = $ARGV[0];
    $end_action = \&notifyFinished;
}

foreach my $file (@files) {
    my $tidy_obj = XML::Tidy->new('filename' => $file);

    # Tidy up the indenting
    $tidy_obj->tidy(' ' x $indent_spaces);

    $tidy_obj->write();
}

$end_action->();

sub zenityNotifyFinished {
    # TODO: check if zenity is installed before doing this
    my $command = qq|`which zenity` --info --title='Complete' --text='$complete_message'|;
    system($command);
}

sub notifyFinished {
    print "$complete_message\n";
}

# called as a nautilus script or cli
sub nautilusContext {
    return 1 if $ENV{'NAUTILUS_SCRIPT_SELECTED_URIS'};
}

