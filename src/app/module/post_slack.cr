require "json"
require "uri"
require "./../../runtime/webhook"

class PostSlack
  def initialize(@name : String, @url : String, @quote : String)
    @slack = WebHook.new  @url
  end

  def post
    post = {
      fallback: "#{@name}「#{@quote}」",
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