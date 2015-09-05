#Example 2-14. Defining an Erb template using the inline approach
require 'sinatra'
get '/index' do erb :index
end

sample_runtime_output = <<-multiline_comment

Client side:
vagrant@rails02:~$ curl  http://0.0.0.0:4567/index
<!DOCTYPE html>
<html> <head>
<meta charset="UTF-8">
<title>Inline template</title> </head>
<body> <h1>Worked!</h1>
</body> </html>

Server side:

127.0.0.1 - - [05/Sep/2015:08:39:37 +0000] "GET /index HTTP/1.1" 200 136 0.0021
localhost - - [05/Sep/2015:08:39:37 UTC] "GET /index HTTP/1.1" 200 136
- -> /index

multiline_comment

__END__
@@index 
<!DOCTYPE html>
<html> <head>
<meta charset="UTF-8">
<title>Inline template</title> </head>
<body> <h1>Worked!</h1>
</body> </html>




