
#Example 2-10. Passing to another matching route
require 'sinatra' 
before do
	content_type :txt 
end

get %r{/(sp|gr)eedy} do
	pass if request.path =~ /\/speedy/ 
	"You got caught in the greedy route!"
end

get '/speedy' do
	"You must have passed to me!"
end


sample_runtime_output = <<-multiline_comment

Client side:
$ curl http://localhost:4567/speedy
You must have passed to me!

Webserver side:
127.0.0.1 - - [29/Aug/2015:10:53:07 +0000] "GET /speedy HTTP/1.1" 200 27 0.0185
localhost - - [29/Aug/2015:10:53:07 UTC] "GET /speedy HTTP/1.1" 200 27
- -> /speedy

multiline_comment
