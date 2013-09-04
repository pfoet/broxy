#!/usr/bin/perl

use strict;

use HTTP::Proxy;
use HTTP::Proxy::BodyFilter::htmltext;


my $port = shift || 1337;
my $broxy = HTTP::Proxy->new( port => $port );

$broxy->push_filter(
	mime => 'text/html',
	response => HTTP::Proxy::BodyFilter::htmltext->new(
		sub { s/[bpBP][rR][oO]/BRO/ig }
	)
);

$broxy->start;
