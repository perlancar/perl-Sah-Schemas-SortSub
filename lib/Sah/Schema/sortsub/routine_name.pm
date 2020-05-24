package Sah::Schema::sortsub::routine_name;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = ['str', {
    summary => 'Sort::Sub routine name',
    match => qr/\A\w+\z/,
    'x.completion' => ['sortsub_routine_name'],
    prefilters => ['Str::replace_dashes_with_underscores'],
}, {}];

1;
# ABSTRACT:
