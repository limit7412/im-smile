require "json"
require "uri"
require "./../app/module/vip2ch"

class App
  def initialize(@url : String)
    dat = Vip2ch.new @url
  end

  def get_data
    story = dat.get
    return story
    # return JSON.parse(res.body)
  end
end