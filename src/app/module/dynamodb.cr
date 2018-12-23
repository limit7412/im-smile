require "json"
require "http/client"
require "uri"

require "awscr-signer"
require "crynamo"

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
    @payload = {
      TableName: @name,
      Key: Crynamo::Marshaller.to_dynamo(key)
    }
  end

  def get_all
    response = @http.post(
      path: "/",
      body: @payload.to_json,
      headers: HTTP::Headers{
        "Content-Type" => "application/x-amz-json-1.0",
        "X-Amz-Target" => "DynamoDB_20120810.#{operation.to_s}",
      },
    )
    return response.body
  end
end
