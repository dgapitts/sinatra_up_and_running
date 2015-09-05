#Example 2-17. Referencing a view in a subfolder
require 'sinatra'

get '/:user/profile' do
    erb '/user/profile'.to_sym
end

get '/:user/help' do 
	erb :'/user/help'
end


sample_runtime_output = <<-multiline_comment

client side:
vagrant@rails02:/vagrant/learn_sinatra$ curl  http://0.0.0.0:4567/dave/profile
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>External template under views/user/profile.erb </title>
</head>
<body>
<h1>Worked!</h1>
</body>
</html>vagrant@rails02:/vagrant/learn_sinatra$ curl  http://0.0.0.0:4567/dave/help
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>External template under views/user/help.erb </title>
</head>
<body>
<h1>Worked!</h1>
</body>
</html>vagrant@rails02:/vagrant/learn_sinatra$ curl  http://0.0.0.0:4567/user/help
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>External template under views/user/help.erb </title>
</head>
<body>
<h1>Worked!</h1>
</body>
</html>vagrant@rails02:/vagrant/learn_sinatra$ curl  http://0.0.0.0:4567/xyz/help
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>External template under views/user/help.erb </title>
</head>
<body>
<h1>Worked!</h1>
</body>
</html>vagrant@rails02:/vagrant/learn_sinatra$ curl  http://0.0.0.0:4567/abc/xyz/help
<!DOCTYPE html>
<html>
<head>
  <style type="text/css">
  body { text-align:center;font-family:helvetica,arial;font-size:22px;
    color:#888;margin:20px}
  #c {margin:0 auto;width:500px;text-align:left}
  </style>
</head>
<body>
  <h2>Sinatra doesn&rsquo;t know this ditty.</h2>
  <img src='http://0.0.0.0:4567/__sinatra__/404.png'>
  <div id="c">
    Try this:
    <pre>get &#x27;&#x2F;abc&#x2F;xyz&#x2F;help&#x27; do
  &quot;Hello World&quot;
end
</pre>
  </div>
</body>
</html>

server side:
- -> /dave/profile
127.0.0.1 - - [05/Sep/2015:09:44:23 +0000] "GET /dave/help HTTP/1.1" 200 164 0.0052
localhost - - [05/Sep/2015:09:44:23 UTC] "GET /dave/help HTTP/1.1" 200 164
- -> /dave/help
127.0.0.1 - - [05/Sep/2015:09:44:32 +0000] "GET /user/help HTTP/1.1" 200 164 0.0047
localhost - - [05/Sep/2015:09:44:32 UTC] "GET /user/help HTTP/1.1" 200 164
- -> /user/help
127.0.0.1 - - [05/Sep/2015:09:44:42 +0000] "GET /xyz/help HTTP/1.1" 200 164 0.0146
localhost - - [05/Sep/2015:09:44:42 UTC] "GET /xyz/help HTTP/1.1" 200 164
- -> /xyz/help
127.0.0.1 - - [05/Sep/2015:09:44:51 +0000] "GET /abc/xyz/help HTTP/1.1" 404 482 0.0015
localhost - - [05/Sep/2015:09:44:51 UTC] "GET /abc/xyz/help HTTP/1.1" 404 482
- -> /abc/xyz/help

multiline_comment