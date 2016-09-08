require 'faraday'
require 'faraday_middleware'
require 'oauth'
require 'simple_oauth'

URL = 'example@test.com' 
PATH = '/test/test'
json = {
  # bodyの中身
}

conn = Faraday.new(url: URL, ssl: { verify: false }) do |builder|
  builder.request :json
  builder.response :json
  builder.adapter :net_http
end

response = conn.post do |req|
  req.url PATH
  req.headers['Content-Type'] = 'application/json'
  req.body = json
end

puts response.body
puts response.status
