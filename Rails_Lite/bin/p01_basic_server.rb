require 'rack'

app = Proc.new do |env|
    req = Rack::Request.new(env)
    res = Rack::Response.new 
    res['Content-Type'] = 'text/html'
    res.write(env)
    res.finish 
end

love = Proc.new do |env|
    req = Rack::Request.new(env)
    res = Rack::Response.new() 
    res['Content-Type'] = 'text/html'
    res.write("#{env["PATH_INFO"]}")
    res.finish 
end

Rack::Server.start(
    app: love,
    Port: 3000
  )

