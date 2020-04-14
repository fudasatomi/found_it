# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# 親カテゴリー
Category.create(id:1, name:"ビーズ", parent_id:0)
Category.create(id:2, name:"編み物・ソーイング", parent_id:0)
Category.create(id:3, name:"アート・雑貨", parent_id:0)
Category.create(id:4, name:"ベビー・キッズ", parent_id:0)

# 子分類　parent_id:1
Category.create(id:5, name:"ネックレス", parent_id:1)
Category.create(id:6, name:"ピアス・イヤリング", parent_id:1)
Category.create(id:7, name:"指輪・ブレスレット", parent_id:1)
Category.create(id:8, name:"ビーズ小物", parent_id:1)
# 子分類　parent_id:2
Category.create(id:9, name:"フェルト", parent_id:2)
Category.create(id:10, name:"ソーイング", parent_id:2)
Category.create(id:11, name:"編み物", parent_id:2)
Category.create(id:12, name:"キルト", parent_id:2)
Category.create(id:13, name:"パッチワーク", parent_id:2)
Category.create(id:14, name:"刺繍", parent_id:2)
Category.create(id:15, name:"その他", parent_id:2)
# 子分類　parent_id:3
Category.create(id:16, name:"ぬいぐるみ・人形", parent_id:3)
Category.create(id:17, name:"カリグラフィー", parent_id:3)
Category.create(id:18, name:"絵手紙", parent_id:3)
Category.create(id:19, name:"コラージュ", parent_id:3)
Category.create(id:20, name:"キャンドル", parent_id:3)
# 子分類　parent_id:4
Category.create(id:21, name:"レッスンバッグ・通園バッグ", parent_id:4)
Category.create(id:22, name:"スタイ", parent_id:4)
Category.create(id:23, name:"スリング・抱っこひも", parent_id:4)
Category.create(id:24, name:"ベビー服", parent_id:4)
Category.create(id:25, name:"子ども服", parent_id:4)
Category.create(id:26, name:"入園・入学グッズ", parent_id:4)