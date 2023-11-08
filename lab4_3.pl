#!/usr/bin/perl    
$|=1; 
print "Content-type: text/html charset: utf-8\n\n";
print <<HTML;
<HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<TITLE>Окружение сервера</TITLE>
</HEAD>
<CENTER><H2>Окружение сервера</H2></CENTER>
<BODY>
HTML
print qq($_ - $ENV{$_}<BR>) for sort keys %ENV;
print qq(
</BODY>
</HTML>
);

