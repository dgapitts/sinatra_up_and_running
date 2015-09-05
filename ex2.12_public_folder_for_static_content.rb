#Example 2-13. A Sinatra application with a route conflict
require 'sinatra'
get '/public.html' do
	'This is delivered via the route.'
end





sample_runtime_output = <<-multiline_comment

Client side:
vagrant@rails02:/vagrant$ curl  http://0.0.0.0:4567/public.html
<!DOCTYPE html> <html>
<head>
<meta charset="UTF-8"> <title>Static file</title>
</head> <body>
<h1>This is a static file.</h1> </body>
</html>

Webserver side:
127.0.0.1 - - [29/Aug/2015:11:12:22 +0000] "GET /public.html HTTP/1.1" 200 143 0.0031
localhost - - [29/Aug/2015:11:12:22 UTC] "GET /public.html HTTP/1.1" 200 143
- -> /public.html

FYI.. here is the static 'public.html' file, under the public folder:
vagrant@rails02:/vagrant/learn_sinatra$ cat public/public.html
<!DOCTYPE html> <html>
<head>
<meta charset="UTF-8"> <title>Static file</title>
</head> <body>
<h1>This is a static file.</h1> </body>
</html>

multiline_comment