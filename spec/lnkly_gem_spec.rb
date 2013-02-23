require 'spec_helper'

ENV['LNKLY_USERNAME'] = "username"
ENV['LNKLY_PASSWORD'] = "password"

require 'lnkly_gem'

describe Lnkly do
  it "should return a shortened link" do
    shortened = Lnkly.shorten("foo")
    shortened.should_not == "foo"
    shortened.should be_a String
  end

  it "should redirect to the correct location" do
    shortened = Lnkly.shorten("http://www.example.com")
    response = HTTParty.get(shortened, follow_redirects: false)
    [301, 302].should include(response.code)
    response.headers["location"].should == "http://www.example.com"
  end
end
