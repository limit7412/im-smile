require "json"
require "uri"

class Vip2ch
  def initialize(@url : String)
    @uri = URI.parse @url
    # @ssl = OpenSSL::SSL::Context::Client.new
    # # Lambda上で動かないので一旦クライアント証明書は無視
    # @ssl.verify_mode = OpenSSL::SSL::VerifyMode::NONE
  end

  def get_dat
    res = HTTP::Client.get "http://ex14.vip2ch.com/news4ssnip/dat/1505546603.dat"
    return res.body
  end
end