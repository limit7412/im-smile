require "json"
require "uri"
require "./module/*"

class App
  def initialize()
    @table = Table.new
  end

  def run
    list = @table.get_list["list"]
    index = Random.rand(list.size)
    idol = list[index]
    slack = PostSlack.new(
      name: idol["name"],
      url: idol["webhook"],
      quote: idol["quote"]
    )

    return slack.post.body
  end
end