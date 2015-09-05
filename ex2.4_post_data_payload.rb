#Example 2-4. Data payloads are stored in the usual array.
#curl -d"User(username)=davep&&User(password)=se3ret"  http://localhost:4567/login

require 'sinatra'


#curl -d"username=davep&&password=se3ret"  http://localhost:4567/login
post '/login' do
	puts params.to_s
	username = params[:username] 
	password = params[:password]
	puts 'password for ' + username.to_s + ' is : ' + password.to_s
end

#curl -X PUT -d"password=se3ret"  http://localhost:4567/users/:username
put '/users/:username' do
	puts 'Updating secret password for user : ' + params[:username]
end



sample_runtime_output = <<-multiline_comment

Client side:
$ curl -X PUT -d"password=se3ret"  http://localhost:4567/users/davep
$

Webserver side:
$ ruby ex2.4_post_data_payload.rb
[2015-08-29 09:21:25] INFO  WEBrick 1.3.1
[2015-08-29 09:21:25] INFO  ruby 2.2.1 (2015-02-26) [x86_64-linux]
== Sinatra (v1.4.6) has taken the stage on 4567 for development with backup from WEBrick
[2015-08-29 09:21:25] INFO  WEBrick::HTTPServer#start: pid=29864 port=4567
Updating secret password for : davep
127.0.0.1 - - [29/Aug/2015:09:21:27 +0000] "PUT /users/davep HTTP/1.1" 200 - 0.0081
localhost - - [29/Aug/2015:09:21:27 UTC] "PUT /users/davep HTTP/1.1" 200 0
- -> /users/davep

multiline_comment
