require "crynamo"
require "./dynamodb"

class Table
  def initialize()
    @dynamo = Dynamodb.new("imasmile")
  end

  def test_dynamo
    @dynamo.get_all
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