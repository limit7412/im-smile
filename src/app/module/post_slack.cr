require "json"
require "uri"
require "./../runtime/webhook"

class PostSlack
  def initialize(@url : String, @quote : String)
    @slack : WebHook = WebHook.new  @url
  end

  def bost_webhook
    post = {
      fallback: @quote,
      pretext: "<@#{ENV["SLACK_ID"]}> #{@quote}",
      # title: error.message,
      # text: error.backtrace.join("\n"),
      # color: "#EB4646",
      # footer: "dat2ohanasi-backend",
    }
    body = {
      attachments: [post]
    }

    return @slack.post body
  end
end