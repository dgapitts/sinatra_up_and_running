#Example 2-9. Using halt to stop a request

require 'sinatra'

get '/halt' do
	'You will not see this output.' 
	halt 500
end


sample_runtime_output = <<-multiline_comment

Client side:
vagrant@rails02:/vagrant$ curl http://localhost:4567/halt
vagrant@rails02:/vagrant$ curl http://localhost:4567/halt
vagrant@rails02:/vagrant$ curl -v http://localhost:4567/halt
* Hostname was NOT found in DNS cache
*   Trying 127.0.0.1...
* Connected to localhost (127.0.0.1) port 4567 (#0)
> GET /halt HTTP/1.1
> User-Agent: curl/7.35.0
> Host: localhost:4567
> Accept: */*
>
< HTTP/1.1 500 Internal Server Error
< Content-Type: text/html;charset=utf-8
< Content-Length: 0
< X-Xss-Protection: 1; mode=block
< X-Content-Type-Options: nosniff
< X-Frame-Options: SAMEORIGIN
* Server WEBrick/1.3.1 (Ruby/2.2.1/2015-02-26) is not blacklisted
< Server: WEBrick/1.3.1 (Ruby/2.2.1/2015-02-26)
< Date: Sat, 29 Aug 2015 09:59:23 GMT
< Connection: Keep-Alive
<
* Connection #0 to host localhost left intact

Webserver side:
127.0.0.1 - - [29/Aug/2015:09:58:12 +0000] "GET /halt HTTP/1.1" 500 - 0.0006
localhost - - [29/Aug/2015:09:58:12 UTC] "GET /halt HTTP/1.1" 500 0
- -> /halt
127.0.0.1 - - [29/Aug/2015:09:58:28 +0000] "GET /halt HTTP/1.1" 500 - 0.0009
localhost - - [29/Aug/2015:09:58:28 UTC] "GET /halt HTTP/1.1" 500 0
- -> /halt
127.0.0.1 - - [29/Aug/2015:09:59:52 +0000] "GET /halt HTTP/1.1" 500 - 0.0010
localhost - - [29/Aug/2015:09:59:52 UTC] "GET /halt HTTP/1.1" 500 0
- -> /halt

multiline_comment