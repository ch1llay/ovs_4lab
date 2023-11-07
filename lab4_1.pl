use LWP::UserAgent;
use HTTP::Request;

# URL сервера и информационного ресурса, заданные преподавателем
my $server_url = 'http://vk.com';
my $resource_url = 'http://yandex.ru/pogoda/';

# Создание объекта UserAgent
my $ua = LWP::UserAgent->new;

# Запрос для получения информации о сервере
my $server_request = HTTP::Request->new(GET => $server_url);

# Выполнение запроса и получение ответа
my $server_response = $ua->request($server_request);

if ($server_response->is_success) {
    # Печать информации о сервере
    print "Информация о сервере:\n";
    print $server_response->header('Server') . "\n";
    print $server_response->header('Date') . "\n";
} else {
    print "Ошибка при получении информации о сервере: " . $server_response->status_line . "\n";
}

# Запрос для получения информации об информационном ресурсе
my $resource_request = HTTP::Request->new(GET => $resource_url);

# Выполнение запроса и получение ответа
my $resource_response = $ua->request($resource_request);

if ($resource_response->is_success) {
    # Печать информации о ресурсе
    print "Информация об информационном ресурсе:\n";
    print $resource_response->header('Content-Type') . "\n";
    print $resource_response->header('Last-Modified') . "\n";
} else {
    print "Ошибка при получении информации об информационном ресурсе: " . $resource_response->status_line . "\n";
}
