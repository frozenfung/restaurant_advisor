# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

category_list =[
	{"name" => "中式餐廳"},
	{"name" => "日本餐廳"},
  {"name" => "義大利餐廳"},
  {"name" => "墨西哥餐廳"},
  {"name" => "素食餐廳"},
  {"name" => "美式餐廳"},
  {"name" => "複合式餐廳"}

]
category_list.each do |category|
  Category.create( :name => category["name"] )
end
