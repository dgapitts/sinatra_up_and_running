#Example 2-7. Demonstrating Sinatra’s “first sufficient match” approach
require 'sinatra'
get '/specific' do
	"You'll never, ever see me."
end
get '/*' do 
	"NOM NOM NOM"
end


sample_runtime_output = <<-multiline_comment

Client side:
vagrant@rails02:/vagrant$ curl http://localhost:4567/specific
You'll never, ever see me.

Webserver side:
127.0.0.1 - - [29/Aug/2015:09:48:04 +0000] "GET /specific HTTP/1.1" 200 26 0.0075
localhost - - [29/Aug/2015:09:48:03 UTC] "GET /specific HTTP/1.1" 200 26
- -> /specific
multiline_comment