require "json"
require "uri"
require "./../app/module/*"

class App
  # def initialize()
  # end

  def run
    story = dat.get
    return story
    # return JSON.parse(res.body)
  end
end