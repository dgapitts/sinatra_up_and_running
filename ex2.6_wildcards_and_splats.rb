#Example 2-6. Using wildcards in a route
require 'sinatra'
get '/*' do
	"You passed in #{params[:splat]}"
end


sample_runtime_output = <<-multiline_comment

Client side:
vagrant@rails02:/vagrant$ curl http://localhost:4567/foo/bar/baz/bop
You passed in ["foo/bar/baz/bop"]

Webserver side:
127.0.0.1 - - [29/Aug/2015:09:39:06 +0000] "GET /foo/bar/baz/bop HTTP/1.1" 200 33 0.0069
localhost - - [29/Aug/2015:09:39:06 UTC] "GET /foo/bar/baz/bop HTTP/1.1" 200 33
- -> /foo/bar/baz/bop

multiline_comment