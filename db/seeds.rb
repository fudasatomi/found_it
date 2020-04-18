# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# 親カテゴリー
ParentCategory.create(id:1, name:"ビーズ/すべて")
ParentCategory.create(id:2, name:"編み物・ソーイング/すべて")
ParentCategory.create(id:3, name:"アート・雑貨/すべて")
ParentCategory.create(id:4, name:"ベビー・キッズ/すべて")

# 子分類　parent_category_id:1
Category.create(id:1, name:"ネックレス", parent_category_id:1)
Category.create(id:2, name:"ピアス・イヤリング", parent_category_id:1)
Category.create(id:3, name:"指輪・ブレスレット", parent_category_id:1)
Category.create(id:4, name:"ビーズ小物", parent_category_id:1)
# 子分類　parent_category_id:2
Category.create(id:5, name:"フェルト", parent_category_id:2)
Category.create(id:6, name:"ソーイング", parent_category_id:2)
Category.create(id:7, name:"編み物", parent_category_id:2)
Category.create(id:8, name:"キルト", parent_category_id:2)
Category.create(id:9, name:"パッチワーク", parent_category_id:2)
Category.create(id:10, name:"刺繍", parent_category_id:2)
Category.create(id:11, name:"その他", parent_category_id:2)
# 子分類　parent_category_id:3
Category.create(id:12, name:"ぬいぐるみ・人形", parent_category_id:3)
Category.create(id:13, name:"カリグラフィー", parent_category_id:3)
Category.create(id:14, name:"絵手紙", parent_category_id:3)
Category.create(id:15, name:"コラージュ", parent_category_id:3)
Category.create(id:16, name:"キャンドル", parent_category_id:3)
# 子分類　parent_category_id:4
Category.create(id:17, name:"レッスンバッグ・通園バッグ", parent_category_id:4)
Category.create(id:18, name:"スタイ", parent_category_id:4)
Category.create(id:19, name:"スリング・抱っこひも", parent_category_id:4)
Category.create(id:20, name:"ベビー服", parent_category_id:4)
Category.create(id:21, name:"子ども服", parent_category_id:4)
Category.create(id:22, name:"入園・入学グッズ", parent_category_id:4)