#Example 2-24. Gracefully handling 500 errors
require 'sinatra'
before do 
	content_type :txt
end

configure do
	set :show_exceptions, false
end

get '/div_by_zero' do 
	0/ 0
	"You won't see me." 
end

error do
	"Y U NO WORK?"
end


sample_runtime_output = <<-multiline_comment

Client side:
vagrant@rails02:/vagrant/learn_sinatra$ curl  http://0.0.0.0:4567/div_by_zero
Y U NO WORK?


Server side:
2015-09-05 10:56:23 - ZeroDivisionError - divided by 0:
	ex2.24_gracefully_handling_500_errors.rb:12:in `/'
	ex2.24_gracefully_handling_500_errors.rb:12:in `block in <main>'
	/home/vagrant/.rbenv/versions/2.2.1/lib/ruby/gems/2.2.0/gems/sinatra-1.4.6/lib/sinatra/base.rb:1610:in `call'
	/home/vagrant/.rbenv/versions/2.2.1/lib/ruby/gems/2.2.0/gems/sinatra-1.4.6/lib/sinatra/base.rb:1610:in `block in compile!'
	/home/vagrant/.rbenv/versions/2.2.1/lib/ruby/gems/2.2.0/gems/sinatra-1.4.6/lib/sinatra/base.rb:974:in `[]'
	/home/vagrant/.rbenv/versions/2.2.1/lib/ruby/gems/2.2.0/gems/sinatra-1.4.6/lib/sinatra/base.rb:974:in `block (3 levels) in route!'
	/home/vagrant/.rbenv/versions/2.2.1/lib/ruby/gems/2.2.0/gems/sinatra-1.4.6/lib/sinatra/base.rb:993:in `route_eval'
	/home/vagrant/.rbenv/versions/2.2.1/lib/ruby/gems/2.2.0/gems/sinatra-1.4.6/lib/sinatra/base.rb:974:in `block (2 levels) in route!'
	/home/vagrant/.rbenv/versions/2.2.1/lib/ruby/gems/2.2.0/gems/sinatra-1.4.6/lib/sinatra/base.rb:1014:in `block in process_route'
	/home/vagrant/.rbenv/versions/2.2.1/lib/ruby/gems/2.2.0/gems/sinatra-1.4.6/lib/sinatra/base.rb:1012:in `catch'
	/home/vagrant/.rbenv/versions/2.2.1/lib/ruby/gems/2.2.0/gems/sinatra-1.4.6/lib/sinatra/base.rb:1012:in `process_route'
	/home/vagrant/.rbenv/versions/2.2.1/lib/ruby/gems/2.2.0/gems/sinatra-1.4.6/lib/sinatra/base.rb:972:in `block in route!'
	/home/vagrant/.rbenv/versions/2.2.1/lib/ruby/gems/2.2.0/gems/sinatra-1.4.6/lib/sinatra/base.rb:971:in `each'
	/home/vagrant/.rbenv/versions/2.2.1/lib/ruby/gems/2.2.0/gems/sinatra-1.4.6/lib/sinatra/base.rb:971:in `route!'
	/home/vagrant/.rbenv/versions/2.2.1/lib/ruby/gems/2.2.0/gems/sinatra-1.4.6/lib/sinatra/base.rb:1084:in `block in dispatch!'
	/home/vagrant/.rbenv/versions/2.2.1/lib/ruby/gems/2.2.0/gems/sinatra-1.4.6/lib/sinatra/base.rb:1066:in `block in invoke'
	/home/vagrant/.rbenv/versions/2.2.1/lib/ruby/gems/2.2.0/gems/sinatra-1.4.6/lib/sinatra/base.rb:1066:in `catch'
	/home/vagrant/.rbenv/versions/2.2.1/lib/ruby/gems/2.2.0/gems/sinatra-1.4.6/lib/sinatra/base.rb:1066:in `invoke'
	/home/vagrant/.rbenv/versions/2.2.1/lib/ruby/gems/2.2.0/gems/sinatra-1.4.6/lib/sinatra/base.rb:1081:in `dispatch!'
	/home/vagrant/.rbenv/versions/2.2.1/lib/ruby/gems/2.2.0/gems/sinatra-1.4.6/lib/sinatra/base.rb:906:in `block in call!'
	/home/vagrant/.rbenv/versions/2.2.1/lib/ruby/gems/2.2.0/gems/sinatra-1.4.6/lib/sinatra/base.rb:1066:in `block in invoke'
	/home/vagrant/.rbenv/versions/2.2.1/lib/ruby/gems/2.2.0/gems/sinatra-1.4.6/lib/sinatra/base.rb:1066:in `catch'
	/home/vagrant/.rbenv/versions/2.2.1/lib/ruby/gems/2.2.0/gems/sinatra-1.4.6/lib/sinatra/base.rb:1066:in `invoke'
	/home/vagrant/.rbenv/versions/2.2.1/lib/ruby/gems/2.2.0/gems/sinatra-1.4.6/lib/sinatra/base.rb:906:in `call!'
	/home/vagrant/.rbenv/versions/2.2.1/lib/ruby/gems/2.2.0/gems/sinatra-1.4.6/lib/sinatra/base.rb:894:in `call'
	/home/vagrant/.rbenv/versions/2.2.1/lib/ruby/gems/2.2.0/gems/rack-protection-1.5.3/lib/rack/protection/xss_header.rb:18:in `call'
	/home/vagrant/.rbenv/versions/2.2.1/lib/ruby/gems/2.2.0/gems/rack-protection-1.5.3/lib/rack/protection/path_traversal.rb:16:in `call'
	/home/vagrant/.rbenv/versions/2.2.1/lib/ruby/gems/2.2.0/gems/rack-protection-1.5.3/lib/rack/protection/json_csrf.rb:18:in `call'
	/home/vagrant/.rbenv/versions/2.2.1/lib/ruby/gems/2.2.0/gems/rack-protection-1.5.3/lib/rack/protection/base.rb:49:in `call'
	/home/vagrant/.rbenv/versions/2.2.1/lib/ruby/gems/2.2.0/gems/rack-protection-1.5.3/lib/rack/protection/base.rb:49:in `call'
	/home/vagrant/.rbenv/versions/2.2.1/lib/ruby/gems/2.2.0/gems/rack-protection-1.5.3/lib/rack/protection/frame_options.rb:31:in `call'
	/home/vagrant/.rbenv/versions/2.2.1/lib/ruby/gems/2.2.0/gems/rack-1.6.4/lib/rack/logger.rb:15:in `call'
	/home/vagrant/.rbenv/versions/2.2.1/lib/ruby/gems/2.2.0/gems/rack-1.6.4/lib/rack/commonlogger.rb:33:in `call'
	/home/vagrant/.rbenv/versions/2.2.1/lib/ruby/gems/2.2.0/gems/sinatra-1.4.6/lib/sinatra/base.rb:218:in `call'
	/home/vagrant/.rbenv/versions/2.2.1/lib/ruby/gems/2.2.0/gems/sinatra-1.4.6/lib/sinatra/base.rb:211:in `call'
	/home/vagrant/.rbenv/versions/2.2.1/lib/ruby/gems/2.2.0/gems/rack-1.6.4/lib/rack/head.rb:13:in `call'
	/home/vagrant/.rbenv/versions/2.2.1/lib/ruby/gems/2.2.0/gems/rack-1.6.4/lib/rack/methodoverride.rb:22:in `call'
	/home/vagrant/.rbenv/versions/2.2.1/lib/ruby/gems/2.2.0/gems/sinatra-1.4.6/lib/sinatra/base.rb:181:in `call'
	/home/vagrant/.rbenv/versions/2.2.1/lib/ruby/gems/2.2.0/gems/sinatra-1.4.6/lib/sinatra/base.rb:2021:in `call'
	/home/vagrant/.rbenv/versions/2.2.1/lib/ruby/gems/2.2.0/gems/sinatra-1.4.6/lib/sinatra/base.rb:1486:in `block in call'
	/home/vagrant/.rbenv/versions/2.2.1/lib/ruby/gems/2.2.0/gems/sinatra-1.4.6/lib/sinatra/base.rb:1795:in `synchronize'
	/home/vagrant/.rbenv/versions/2.2.1/lib/ruby/gems/2.2.0/gems/sinatra-1.4.6/lib/sinatra/base.rb:1486:in `call'
	/home/vagrant/.rbenv/versions/2.2.1/lib/ruby/gems/2.2.0/gems/rack-1.6.4/lib/rack/handler/webrick.rb:88:in `service'
	/home/vagrant/.rbenv/versions/2.2.1/lib/ruby/2.2.0/webrick/httpserver.rb:138:in `service'
	/home/vagrant/.rbenv/versions/2.2.1/lib/ruby/2.2.0/webrick/httpserver.rb:94:in `run'
	/home/vagrant/.rbenv/versions/2.2.1/lib/ruby/2.2.0/webrick/server.rb:294:in `block in start_thread'
127.0.0.1 - - [05/Sep/2015:10:56:23 +0000] "GET /div_by_zero HTTP/1.1" 500 12 0.0062
localhost - - [05/Sep/2015:10:56:23 UTC] "GET /div_by_zero HTTP/1.1" 500 12
- -> /div_by_zero

multiline_comment







