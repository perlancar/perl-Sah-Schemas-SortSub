package Sah::Schema::sortsub::spec;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = ['str', {
    summary => 'Sort::Sub specification string (name + optional <i,r>)',
    match => qr/\A\w+(?:<[ir]*>)?\z/,
    'x.completion' => ['sortsub_spec'],
}, {}];

1;
# ABSTRACT:
