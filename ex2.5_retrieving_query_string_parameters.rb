#Example 2-5. Retrieving query string parameters
require 'sinatra'

#curl http://localhost:4567/some_name?foo=XYZ
get '/:name' do
	"You asked for #{params[:name]} as well as #{params[:foo]}"
end


sample_runtime_output = <<-multiline_comment

Client side:
vagrant@rails02:/vagrant$ curl http://localhost:4567/some_name?foo=XYZ
You asked for some_name as well as XYZ

Webserver side ():
127.0.0.1 - - [29/Aug/2015:09:35:22 +0000] "GET /some_name?foo=XYZ HTTP/1.1" 200 38 0.0008
localhost - - [29/Aug/2015:09:35:22 UTC] "GET /some_name?foo=XYZ HTTP/1.1" 200 38
- -> /some_name?foo=XYZ

NB John learning Python 
    Myria ... Samuels partner
    American lady (Linda)
multiline_comment