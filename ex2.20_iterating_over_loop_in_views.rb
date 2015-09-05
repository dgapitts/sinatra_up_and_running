#Example 2-20. Iterating over a loop in a view
require 'sinatra'
get '/home' do
  @users = ['Sally', 'Jerry', 'Rocko'] 
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

     <p>Sally</p>

     <p>Jerry</p>

     <p>Rocko</p>

</body>
</html>


Server side:

127.0.0.1 - - [05/Sep/2015:10:09:40 +0000] "GET /home HTTP/1.1" 200 201 0.0118
localhost - - [05/Sep/2015:10:09:40 UTC] "GET /home HTTP/1.1" 200 201
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
  <% @users.each do |user| %>
     <p><%= user %></p> 
  <% end %>
</body> 
</html>





