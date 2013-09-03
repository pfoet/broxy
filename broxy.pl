#!/usr/bin/perl

use strict;

use HTTP::Proxy;
use HTTP::Proxy::BodyFilter::simple;


my $port = shift || 1337;
my $broxy = HTTP::Proxy->new( port => $port );

$broxy->push_filter(
	response => HTTP::Proxy::BodyFilter::simple->new(
		sub { ${ $_[1] } =~ s/[bpBP][rR][oO]/BRO/ig }
	)
);

$broxy->start;
