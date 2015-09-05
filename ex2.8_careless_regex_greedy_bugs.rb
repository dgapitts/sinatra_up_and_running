#Example 2-8. Careless regular expressions can lead to greedy bugs
require 'sinatra'

get %r{/(sp|gr)eedy} do
 "You got caught in the greedy route!"
end

get '/speedy' do
 "No one calls me :("
end

get '/greedy' do
 "No one calls me either!"
end


sample_runtime_output = <<-multiline_comment

Client side:
vagrant@rails02:/vagrant$ curl http://localhost:4567/greedy
You got caught in the greedy route!

vagrant@rails02:/vagrant$ curl http://localhost:4567/speedy
You got caught in the greedy route!

Webserver side:
127.0.0.1 - - [29/Aug/2015:09:53:16 +0000] "GET /greedy HTTP/1.1" 200 35 0.0068
localhost - - [29/Aug/2015:09:53:16 UTC] "GET /greedy HTTP/1.1" 200 35
- -> /greedy
127.0.0.1 - - [29/Aug/2015:09:54:03 +0000] "GET /speedy HTTP/1.1" 200 35 0.0007
localhost - - [29/Aug/2015:09:54:03 UTC] "GET /speedy HTTP/1.1" 200 35
- -> /speedy

multiline_comment