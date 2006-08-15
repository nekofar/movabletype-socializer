# Socializer plugin for Movable Type
# Author: Milad Nekofar (http://www.nekofar.com)
# Released under the Artistic License
#
# $Id:$

package MT::Plugin::Socializer;

use strict;
use MT::Plugin;

my $plugin = MT::Plugin->new ({
	name => '<MT_TRANS phrase="Socializer">',
	version => '0.1',
	description => '<MT_TRANS phrase="Add socializer link to your entries.">',
	author_name => '<MT_TRANS phrase="Milad Nekofar">',
	author_link => 'http://weblog.nekofar.com/',
	l10n_class => 'Socializer::L10N',
});
MT->add_plugin($plugin);

use MT::Template::Context;
MT::Template::Context->add_tag ('EntrySocializerLink',\&socializer_link);

# add socializer link
sub socializer_link {
        my($ctx, $arg) = @_;
        my $entry = $ctx->stash('entry');
        my $perma_link = $entry->permalink;
        my $title = $entry->title;
        my $socializer_link = "http://ekstreme.com/socializer/?url=".$perma_link."&title=".$title."";
        return $socializer_link;
}