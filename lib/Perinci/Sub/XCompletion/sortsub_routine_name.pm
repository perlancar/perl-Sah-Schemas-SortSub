package Perinci::Sub::XCompletion::sortsub_routine_name;

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
    require Complete::Module;

    my %fargs = @_;

    sub {
        my %cargs = @_;
        my $word    = $cargs{word} // '';
        Complete::Module::complete_module(
            word => $word,
            ns_prefix => "Sort::Sub",
        );
    };
}

1;
# ABSTRACT: Generate completion for Sort::Sub routine name
