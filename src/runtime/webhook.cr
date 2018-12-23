require "json"
require "uri"
require "openssl"

class WebHook
  def initialize(@url : String)
    @uri = URI.parse @url
  end

  def post(body)
    ssl = OpenSSL::SSL::Context::Client.new
    # Lambda上で動かないので一旦クライアント証明書は無視
    ssl.verify_mode = OpenSSL::SSL::VerifyMode::NONE

    HTTP::Client.post(@uri,
      body: body.to_json,
      tls: ssl
    )
  end
end