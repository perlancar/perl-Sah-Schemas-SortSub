package Sah::Schema::sortsub::routine_name;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = ['hash', {
    summary => 'Sort::Sub routine name',
    of => ['str', {req=>1}, {}],
    'x.element_completion' => ['sortsub_routine_arg'],
}, {}];

1;
# ABSTRACT:
