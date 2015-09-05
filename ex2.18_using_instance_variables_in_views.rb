#Example 2-18. Creating instance variables for use in a view

require 'sinatra'
get '/home' do
  @name = 'Random User' 
  erb :home
end

sample_runtime_output = <<-multiline_comment

Client side:
vagrant@rails02:/vagrant/learn_sinatra$ curl  http://0.0.0.0:4567/home
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Using instance variables</title>
</head>
<body>
<h1>Hello, Random User!</h1>
</body>
</html>

Server side:
127.0.0.1 - - [05/Sep/2015:10:00:31 +0000] "GET /home HTTP/1.1" 200 160 0.0104
localhost - - [05/Sep/2015:10:00:31 UTC] "GET /home HTTP/1.1" 200 160
- -> /home

multiline_comment

__END__
@@home 
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>Using instance variables</title> 
</head>
<body>
<h1>Hello, <%= @name %>!</h1>
</body> 
</html>




