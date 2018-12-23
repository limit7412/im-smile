require "json"
require "http/client"
require "uri"

require "awscr-signer"

class Dynamodb
  def initialize(@name : String)
    ssl = OpenSSL::SSL::Context::Client.new
    # Lambda上で明示的にクライアント証明書を示す必要がある
    ssl.ca_certificates = "/etc/pki/tls/cert.pem"

    @uri = URI.parse("https://dynamodb-ap-northeast-1.amazonaws.com/")
    @http = HTTP::Client.new(@uri,
      tls: ssl
    )
    @http.before_request do |request|
      signer = Awscr::Signer::Signers::V4.new(
        "dynamodb",
        "ap-northeast-1",
        ENV["AWS_ACCESS_KEY_ID"],
        ENV["AWS_SECRET_ACCESS_KEY"]
      )
      signer.sign(request)
    end
  end

  def get_all
    return HTTP::Client.new(@uri.host.to_s) do |client|
      headers = @signer.sign_headers("GET", @uri)
      response = client.get(@uri.path.to_s, headers)
      return response.body
    end
  end
end