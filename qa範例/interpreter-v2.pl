#!/usr/bin/perl

$env = $ARGV[0];
$playbook = $ARGV[1];
$host = $ARGV[2];
$proj = $ARGV[3];

$out=`ssh $env 'ansible-playbook $playbook -e project=$proj -e host=$host'`;
print $out;

ansible-playbook current_new.yml -e "host=web1 project=web/bin/fe_admin"