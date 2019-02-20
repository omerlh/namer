# http_server.rb
require 'socket'
require 'erb'
require 'faker'

server = TCPServer.new 8752

puts "server listening on port 8752"

while session = server.accept
  request = session.gets
  puts request

  name = Faker::Company.name
  bs = Faker::Company.bs
  template = ERB.new(File.read("index.html.erb"))

  session.print "HTTP/1.1 200\r\n" # 1
  session.print "Content-Type: text/html\r\n" # 2
  session.print "\r\n" # 3
  session.print template.result(binding) #4

  session.close
end