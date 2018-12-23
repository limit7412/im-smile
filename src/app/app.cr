require "json"
require "uri"
require "./module/*"

class App
  def initialize()
    @table = Table.new
  end

  def run
    idol = @table.get_idol
    slack = PostSlack.new(
      name: idol["name"],
      url: idol["webhook"],
      quote: idol["quote"]
    )

    # return idol
    return slack.post.body
  end
end