Shop.create!(
  [
    {
      name: "Rapha Cycle Club TOKYO",
      prefecture: "東京都",
      city: "渋谷区",
      address: "千駄ヶ谷3-1-6",
      latitude: "35.6761350137012",
      longitude: "139.70599315314215",
      business_hour: "平日 12時00分～19時30分\n土日祝 12時00分～19時00分",
      cashless: true,
      bike_rack: true,
      remarks: "イギリスの大人気サイクルウェアブランド「Rapha」が運営するカフェです。"
    },{
      name: "クロスコーヒー チョコレート＆サンドイッチズ",
      prefecture: "東京都",
      city: "稲城市",
      address: "矢野口227-1 グランツドルフ 1階",
      latitude: "35.64241061196812",
      longitude: "139.52132246502677",
      business_hour: "全日 7時00分～17時00分",
      cashless: true,
      bike_rack: true,
      remarks: "オーダージャージで有名なサイクルウェアブランド「Champion System」のブラッグシップショップ併設。"
    },{
      name: "カフェ アリカ(Cafe arica)",
      prefecture: "東京都",
      city: "板橋区",
      address: "南常盤台2-3-12",
      latitude: "35.75981758100577",
      longitude: "139.68658638695737",
      business_hour: "13時00分～22時00分\n定休日: 水曜日",
      cashless: false,
      bike_rack: true,
      remarks: "スリランカカレーが人気のボローニャ風のイタリアンカフェ。"
    },{
      name: "TAKAO Coffee",
      prefecture: "東京都",
      city: "八王子市",
      address: "高尾町2400-1",
      latitude: "35.63039590132987",
      longitude: "139.2697659090371",
      business_hour: "全日 10時00分～18時00分",
      cashless: true,
      bike_rack: true,
      remarks: "高尾山の麓にあるカフェ。ケーキなどの焼き菓子も提供しています。"
    },{
      name: "Mt. TAKAO BASE CAMPカフェ&バー",
      prefecture: "東京都",
      city: "八王子市",
      address: "高尾町1799-3",
      latitude: "35.635747241509314",
      longitude: "139.27059252499615",
      business_hour: "7時00分～20時00分\n定休日: 不定休",
      cashless: true,
      bike_rack: true,
      remarks: "登山客やトレイルランナーが多く集うホステルが運営するカフェ&バーです。"
    }
  ]
)

User.create!(
  [
    {
      name: "admin",
      email: "admin@gmail.com",
      password: "sample",
      admin: true
    },{
      name: "admin2",
      email: "admin2@gmail.com",
      password: "sample",
      admin: true
    },{
      name: "guest",
      email: "guest@gmail.com",
      password: "sample",
      admin: false
    },{
      name: "guest2",
      email: "guest2@gmail.com",
      password: "sample",
      admin: false
    },{
      name: "guest3",
      email: "guest3@gmail.com",
      password: "sample",
      admin: false
    },
  ]
)

Genre.create!(
  [
    {
      name: "カフェ"
    },{
      name: "レストラン"
    },{
      name: "イタリア料理"
    },{
      name: "インド料理"
    },{
      name: "フランス料理"
    }
  ]
)

ShopGenre.create!(
  [
    {
      shop_id: "1",
      genre_id: "1"
    },{
      shop_id: "2",
      genre_id: "1"
    },{
      shop_id: "3",
      genre_id: "1"
    },{
      shop_id: "3",
      genre_id: "3"
    },{
      shop_id: "4",
      genre_id: "1"
    },{
      shop_id: "5",
      genre_id: "1"
    }
  ]
)

10.times do
  User.find(rand(1..5)).saved_shops.create!(shop_id: rand(1..5))
end

10.times do
  User.find(rand(1..5)).favorites.create!(shop_id: rand(1..5))
end

10.times do
  User.find(rand(1..5)).browsing_histories.create!(shop_id: rand(1..5))
end