#Requires httparty but will eventually use just Net::HTTP
require 'httparty'

class Lnkly
  USERNAME = ENV['LNKLY_USERNAME']
  PASSWORD = ENV['LNKLY_PASSWORD']
  BASE_URL = "http://localhost:5000"

  def self.shorten(url)
    composite_url = BASE_URL + "/create"
    response = HTTParty.post(composite_url, body: {url: url}, basic_auth: {username: USERNAME, password: PASSWORD})
    response.parsed_response
  end
end
