require 'faraday'
require 'json'

module SearchbotApi
  class Client
    API_PATH = '/api/v1'
    def initialize
      @connection = Faraday.new(url: "http://localhost:3001") do |conn|
        conn.headers['Accept']       = "application/json"
        conn.headers['Content-Type'] = "application/json"
      end
    end

    def get(path, params)
      resp = @connection.get do |req|
        req.url = "#{API_PATH}#{path}"
        params.each do |name, value|
          req.params[name] = value
        end
      end
      JSON.parse(resp.body)
    end
  end
end
