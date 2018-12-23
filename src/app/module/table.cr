require "crynamo"

class Table
  def initialize()
  #   config = Crynamo::Configuration.new(
  #     access_key_id: ENV["AWS_ACCESS_KEY"],
  #     secret_access_key: ENV["AWS_SECRET_KEY"],
  #     region: "ap-northeast-1",
  #     endpoint: "https://dynamodb.ap-northeast-1.amazonaws.com",
  #   )
  #   @dynamo = Crynamo::Client.new(config)
  end

  # def get_list(@table : String)
  def get_list
    idols = {
      list: [
        {
          name: "島村卯月",
          webhook: ENV["WEBHOOK_URL_UZUKI"],
          quote: "てすと"
        },
        {
          name: "渋谷凛",
          webhook: ENV["WEBHOOK_URL_RIN"],
          quote: "てすと"
        },
        {
          name: "本田未央",
          webhook: ENV["WEBHOOK_URL_MIO"],
          quote: "てすと"
        },
      ]
    }
  end

  def random_index(index : Number)
    Random.rand(index - 1)
  end
end