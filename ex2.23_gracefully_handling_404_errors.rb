#Example 2-23. Gracefully handling 404 errors
require 'sinatra'

before do 
	content_type :txt
end

not_found do
	"Whoops! You requested a route that wasn't available."
end

sample_runtime_output = <<-multiline_comment

Client side:
vagrant@rails02:/vagrant/learn_sinatra$ curl  http://0.0.0.0:4567/
before_value has been set to foo


Server side:
After filter called to perform some task.
127.0.0.1 - - [05/Sep/2015:10:30:03 +0000] "GET / HTTP/1.1" 200 32 0.0023
localhost - - [05/Sep/2015:10:30:03 UTC] "GET / HTTP/1.1" 200 32
- -> /

multiline_comment







