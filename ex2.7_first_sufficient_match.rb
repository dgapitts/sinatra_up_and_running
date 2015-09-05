#Example 2-7. Demonstrating Sinatra’s “first sufficient match” approach
require 'sinatra'
get '/*' do 
	"NOM NOM NOM"
end
get '/specific' do
	"You'll never, ever see me."
end

sample_runtime_output = <<-multiline_comment

Client side:
vagrant@rails02:/vagrant$ curl http://localhost:4567/specific
NOM NOM NOM


Webserver side:
127.0.0.1 - - [29/Aug/2015:09:46:25 +0000] "GET /specific HTTP/1.1" 200 11 0.0066
localhost - - [29/Aug/2015:09:46:25 UTC] "GET /specific HTTP/1.1" 200 11
- -> /specific

multiline_comment