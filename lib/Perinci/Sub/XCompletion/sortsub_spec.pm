package Perinci::Sub::XCompletion::sortsub_spec;

# AUTHORITY
# DATE
# DIST
# VERSION

use 5.010001;
use strict;
use warnings;
use Log::ger;

our %SPEC;

$SPEC{gen_completion} = {
    v => 1.1,
};
sub gen_completion {
    require Complete::Sequence;
    require Complete::Util;
    require Module::List::Tiny;

    my %fargs = @_;

    sub {
        my %cargs = @_;
        my $word    = $cargs{word} // '';

        Complete::Sequence::complete_sequence(
            word => $word,
            sequence => [
                sub {
                    my $mods = Module::List::Tiny::list_modules("Sort::Sub::", {list_modules=>1});
                    my @words;
                    for (sort keys %$mods) {
                        s/\ASort::Sub:://;
                        push @words, $_     if $cargs{offer_unprefixed} // 1;
                        push @words, "\$$_" if $cargs{offer_dollar_prefixed};
                    }
                    \@words;
                },
                ["", "<>", "<i>", "<r>", "<ir>"],
            ],
        );
    };
}

1;
# ABSTRACT: Generate completion for Sort::Sub spec

=head1 ARGUMENTS

=head2 offer_dollar_prefixed

Bool. Default false.

=head2 offer_unprefixed

Bool. Default true.
