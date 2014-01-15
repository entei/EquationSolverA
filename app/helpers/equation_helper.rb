module EquationHelper
  require 'net/http'
  require "uri"
  require 'json'

  class MyHTTP
    # POST json method
    def self.post url, data
      uri = URI.parse(URI::escape(url))
      headers = {'Content-Type' =>'application/json'}
      request = Net::HTTP::Post.new(uri.request_uri, headers)
      request.body = data
      #request["Authorization"] ='SOMEAUTH'
      Net::HTTP.new(uri.host, uri.port).start {|http| http.request(request) }  
    end
  end
end
