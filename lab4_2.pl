use strict;
use warnings;
use LWP::UserAgent;

use File::Path qw(make_path);
eval { make_path("get") };
eval { make_path("post") };
eval { make_path("head") };


# URL для запроса
my $url = 'http://ya.ru';
my $url_post = 'http://localhost:8001/calculate';

# Создаем объект UserAgent
my $ua = LWP::UserAgent->new;

# Получаем информационный ресурс методом GET
my $response = $ua->get($url);

# Сохраняем заголовки ответа в файл
open(my $headers_file, '>', 'get/headers.txt') or die "Не удалось открыть файл: $!";
print $headers_file $response->headers->as_string;
close $headers_file;

# Сохраняем информационный ресурс в файл
open(my $content_file, '>', './get/content.html') or die "Не удалось открыть файл: $!";
print $content_file $response->content;
close $content_file;

# Получаем информационный ресурс методом Post

my $req = HTTP::Request->new(POST => $url_post);
$req->content('{"a":1, "b": 2}');
my $response_post = $ua->request($req);

# Сохраняем заголовки ответа в файл
open(my $headers_file_post, '>', './post/headers.txt') or die "Не удалось открыть файл: $!";
print $headers_file_post $response_post->headers->as_string;
close $headers_file_post;

# Сохраняем информационный ресурс в файл
open(my $content_file_post, '>', 'post/content.html') or die "Не удалось открыть файл: $!";
print $content_file_post $response_post->content;
close $content_file_post;

# Получаем информационный ресурс методом Head

my $response_head = $ua->head($url);

# Сохраняем заголовки ответа в файл
open(my $headers_file_head, '>', './head/headers.txt') or die "Не удалось открыть файл: $!";
print $headers_file_head $response_head->headers->as_string;
close $headers_file_head;

# Сохраняем информационный ресурс в файл
open(my $content_file_head, '>', 'head/content.html') or die "Не удалось открыть файл: $!";
print $content_file_head $response_head->content;
close $content_file_head;

# Выводим сообщение об успешном выполнении
print "Запрос выполнен успешно. Результаты сохранены в файлы headers.txt и content.html\n";
