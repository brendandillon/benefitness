require 'base64'

class FitbitService
  def initialize(auth_code)
    @auth_code = auth_code
  end
  
  def sync(user)
    tokens = get_tokens
    user.update(fitbit_access_token: tokens[:access_token])
    user.update(fitbit_refresh_token: tokens[:refresh_token])
  end
  
  private
    attr_reader :auth_code

    def get_tokens
      JSON.parse(send_auth_code.body, symbolize_names: true)
    end

    def send_auth_code
      conn.post do |req|
        req.url 'oauth2/token'
        req.headers['Authorization'] = auth_header
        req.headers['Content-Type'] = 'application/x-www-form-urlencoded'
        req.body = "code=#{auth_code}&client_id=#{ENV["fitbit_client_id"]}&grant_type=authorization_code"
      end
    end

    def auth_header
      "Basic " + Base64.encode64(ENV['fitbit_client_id'] + 
                                 ":" + 
                                 ENV['fitbit_client_secret'])
    end

    def conn
      Faraday.new(url: 'https://api.fitbit.com/') do |faraday|
        faraday.request :url_encoded
        faraday.adapter Faraday.default_adapter
      end
    end
end
