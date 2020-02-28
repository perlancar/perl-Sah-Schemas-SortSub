package Sah::Schema::sortsub::spec;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = ['str', {
    summary => 'Sort::Sub specification string (name + optional <i,r>)',
    match => qr/\A\w+(?:<[ir]*>)?\z/,
    'x.completion' => ['sortsub_spec'],
    prefilters => ['Str::replace_dashes_with_underscores'],
}, {}];

1;
# ABSTRACT:
