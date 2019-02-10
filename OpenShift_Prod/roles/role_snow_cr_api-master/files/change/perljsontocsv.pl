#!/usr/bin/perl

use warnings;
use strict;
use Text::CSV;
use JSON::MaybeXS;
use FileHandle ;
use IO::Handle;

local( $/, *FH ) ;
open( FH, '<', 'input.json' );
my $text = <FH>;

my $data = decode_json($text);

my $csv = Text::CSV->new({auto_diag=>2,binary=>1, eol=>"\n", always_qu
+ote=>1 });

my @fields = qw/ Timestamp    Average         Unit /;
$csv->print(select, \@fields);
for my $datapoint ( @{ $data->{Datapoints} } ) {
    $csv->print(select, [ map {$datapoint->{$_}} @fields ]);
}

