#Example 2-11. Redirect a request with optional status codes
require 'sinatra'

get '/redirect' do
	redirect 'http://www.google.com'
end

get '/redirect2' do
	redirect 'http://www.google.com', 301
end


sample_runtime_output = <<-multiline_comment


Difference between 301 and 302 http status codes:
- 301 redirection - more permant i.e. the URL may have worked in the past but in the future the client should only request the new location
- 302 redirection - but only temporarily


Client side:
vagrant@rails02:/vagrant$ curl -v http://localhost:4567/redirect
* Hostname was NOT found in DNS cache
*   Trying 127.0.0.1...
* Connected to localhost (127.0.0.1) port 4567 (#0)
> GET /redirect HTTP/1.1
> User-Agent: curl/7.35.0
> Host: localhost:4567
> Accept: */*
>
< HTTP/1.1 302 Found
< Content-Type: text/html;charset=utf-8
< Location: http://www.google.com
< Content-Length: 0
< X-Xss-Protection: 1; mode=block
< X-Content-Type-Options: nosniff
< X-Frame-Options: SAMEORIGIN
* Server WEBrick/1.3.1 (Ruby/2.2.1/2015-02-26) is not blacklisted
< Server: WEBrick/1.3.1 (Ruby/2.2.1/2015-02-26)
< Date: Sat, 29 Aug 2015 10:58:44 GMT
< Connection: Keep-Alive
<
* Connection #0 to host localhost left intact
vagrant@rails02:/vagrant$ curl -v http://localhost:4567/redirect2
* Hostname was NOT found in DNS cache
*   Trying 127.0.0.1...
* Connected to localhost (127.0.0.1) port 4567 (#0)
> GET /redirect2 HTTP/1.1
> User-Agent: curl/7.35.0
> Host: localhost:4567
> Accept: */*
>
< HTTP/1.1 301 Moved Permanently
< Content-Type: text/html;charset=utf-8
< Location: http://www.google.com
< Content-Length: 0
< X-Xss-Protection: 1; mode=block
< X-Content-Type-Options: nosniff
< X-Frame-Options: SAMEORIGIN
* Server WEBrick/1.3.1 (Ruby/2.2.1/2015-02-26) is not blacklisted
< Server: WEBrick/1.3.1 (Ruby/2.2.1/2015-02-26)
< Date: Sat, 29 Aug 2015 10:58:56 GMT
< Connection: Keep-Alive
<
* Connection #0 to host localhost left intact


Webserver side:
127.0.0.1 - - [29/Aug/2015:10:58:44 +0000] "GET /redirect HTTP/1.1" 302 - 0.0012
localhost - - [29/Aug/2015:10:58:44 UTC] "GET /redirect HTTP/1.1" 302 0
- -> /redirect
127.0.0.1 - - [29/Aug/2015:10:58:56 +0000] "GET /redirect2 HTTP/1.1" 301 - 0.0011
localhost - - [29/Aug/2015:10:58:56 UTC] "GET /redirect2 HTTP/1.1" 301 0
- -> /redirect2
multiline_comment