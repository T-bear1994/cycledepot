# Welcome to Cycle Depot！
### What is "Cycle Depot"?
(English follows Japanese.)
Cycle Depot(サイクルデポ)は、ロードバイクでのライド中に立ち寄りやすいお店をまとめたデータベースです。あなたのいる場所、あるいはこれから行く場所にあるロードバイクで立ち寄りやすいお店を検索して簡単に見つけることができます。

Cycle Depot is a database of cyclist friendly shops that you can stop by during your road bike ride! Wherever you are, or Wherever you are going, you can easily find shops that you can take a rest with your precious bike!

### Environment(開発環境)
- Ruby3.0.1
- Rails6.0.5.1
- PostgreSQL13.7


### How to install in your computer(実行手順)
```
$ git clone https://github.com/T-bear1994/cycledepot.git
$ cd cycledepot
$ bundle install
$ rails db:create && rails db:migrate
$ rails s
```

### Concept, database specification(カタログ設計、テーブル定義書)
https://docs.google.com/spreadsheets/d/1tZgfhq0sqLxmmQdVI7Gin8hlAvTP9zoNAiefds2l2Zo/edit?usp=sharing

### Wireframe design(ワイヤーフレーム)
https://www.figma.com/file/wt17fp8J4EcFffnyOGCaMY/CycleDepot(draft)?node-id=0%3A1

### ER diagram(ER図)
![ER図の画像](https://i.gyazo.com/eb7ddccfc6da785de82bf877a8c035a7.png)

### Screen transition diagram(画面遷移図)
![画面遷移図](https://i.gyazo.com/18e7917885871fd55134f33bda399a70.png)
