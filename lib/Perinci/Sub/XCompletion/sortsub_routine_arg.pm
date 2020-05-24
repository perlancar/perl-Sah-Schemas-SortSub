package Perinci::Sub::XCompletion::sortsub_routine_arg;

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

    my %fargs = @_;

    sub {
        my %cargs = @_;

        # do we have the routine already? if yes, extract the metadata
        my $rname;
        {
            $rname = $routine;
            last if defined $rname;
            $rname = $cargs{words}[0] if @{ $cargs{words} };
        }
        return [] unless defined $rname;

        my $mod = "Sort::Sub::$rname";
        (my $mod_pm = "$mod.pm") =~ s!::!/!g;
        eval { require $mod_pm };
        return {message=>"Cannot load $mod: $@"} if $@;
        my $meta;
        eval { $meta = $mod->meta };
        return [] unless $meta;

        return Complete::Sequence::complete_sequence(
            word => $cargs{word},
            sequence => [
                sub {
                    [$meta->{args} ? keys(%{ $meta->{args} }) : ()];
                },
                '=',
                sub {
                    my $stash = shift;
                    my $argname = $stash->{completed_item_words}[0];
                    return [] unless defined $argname;

                    my $argspec = $meta->{args}{$argname};
                    return [] unless $argspec->{schema};

                    require Complete::Sah;
                    arrayify_answer(
                        Complete::Sah::complete_from_schema(
                            word => $stash->{cur_word},
                            schema => $argspec->{schema},
                        )
                      );

                },
            ],
        );
    };
}

1;
# ABSTRACT: Generate completion for Sort::Sub routine argument
