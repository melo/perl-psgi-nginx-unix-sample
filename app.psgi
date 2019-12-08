#!/usr/bin/perl

use Data::Dumper;

sub {
  return [
     200,
    ['Content-Type: text/plain'],
    [ 
      join("\n", map { "$_: $ENV{$_}" } sort keys %ENV),
      "\n\n\n",
      Dumper(\@_),
    ]
  ];
}
