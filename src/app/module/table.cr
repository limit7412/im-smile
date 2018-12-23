require "crynamo"

class Table
  def initialize()
    # config = Crynamo::Configuration.new(
    #   access_key_id: ENV["AWS_ACCESS_KEY_ID"],
    #   secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
    #   region: "ap-northeast-1",
    #   endpoint: "https://dynamodb.ap-northeast-1.amazonaws.com",
    # )
    # @dynamo = Crynamo::Client.new(config)
  end

  def get_idol
    index = Random.rand(get_list.size)
    get_list[index]
  end

  def get_list
    return [
      {
        name: "島村卯月",
        webhook: ENV["WEBHOOK_URL_UZUKI"],
        quote: "頑張りましたねプロデューサーさん！ えらいです！"
      },
      {
        name: "渋谷凛",
        webhook: ENV["WEBHOOK_URL_RIN"],
        quote: "お疲れさま、プロデューサー。まぁ、気づかいぐらいはね"
      },
      {
        name: "本田未央",
        webhook: ENV["WEBHOOK_URL_MIO"],
        quote: "頑張ったねプロデューサー！えらいぞ〜この未央ちゃんが褒めてしんぜよう"
      },
    ]
  end
end