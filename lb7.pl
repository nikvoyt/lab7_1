#!/usr/bin/perl

print "Content-type: text/html; charset=UTF-8\n\n";

my $query = $ENV{'QUERY_STRING'};

sub decode {
    my $str = shift;
    $str =~ s/\+/ /g;
    $str =~ s/%([0-9A-Fa-f]{2})/chr(hex($1))/ge;
    return $str;
}

print "<html><head><meta charset='UTF-8'></head><body style='text-align: center;'>\n" ;
print "<h1>Данные:</h1>\n";

print "<p><b>Фамилия:</b> ", decode($1), "</p>" if $query =~ /sur=([^&]*)/ ;
print "<p><b>Имя:</b> ", decode($1), "</p>" if $query =~ /name=([^&]*)/;
print "<p><b>Отчество:</b> ", decode($1), "</p>" if $query =~ /patronymic=([^&]*)/;

print "</body></html>\n";