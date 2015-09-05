#Example 2-22. Using before and after filters
require 'sinatra'

before do
  @before_value = 'foo'
end

get '/' do
  "before_value has been set to #{@before_value}"
end 

after do
  puts "After filter called to perform some task." 
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







