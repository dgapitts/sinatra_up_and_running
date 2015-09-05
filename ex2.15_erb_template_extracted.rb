#Example 2-15. The Erb template has been extracted
require 'sinatra'
get '/index' do erb :index
end

sample_runtime_output = <<-multiline_comment

Client side:
</html>vagrant@rails02:~$ curl  http://0.0.0.0:4567/index
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>External template</title>
</head>
<body>
<h1>Worked!</h1>
</body>

Server side:
127.0.0.1 - - [05/Sep/2015:08:50:48 +0000] "GET /index HTTP/1.1" 200 146 0.0049
localhost - - [05/Sep/2015:08:50:48 UTC] "GET /index HTTP/1.1" 200 146
- -> /index

multiline_comment





