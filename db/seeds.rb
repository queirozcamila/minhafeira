# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Shop.destroy_all
Product.destroy_all

user = User.create!(
  email: "user@gmail.com",
  password: "123456789"
 )


shop = Shop.create!(
  name: 'Mister orgânicos',
  address: 'Rua Visconde de Pirajá, 120 - Ipanema/Rio de Janeiro',
  description: 'Banca de produtos orgânicos',
  user: user,
  latitude: -22.982234699999996,
  longitude: -43.199285499999995
 )

Shop.create!(
  name: 'Frutas.com',
  address: 'Rua Gomes Carneiro, 75 - Ipanema/Rio de Janeiro',
  description: 'Banca especializada em frutas frescas',
  user: user
 )

Shop.create!(
  name: 'Sr. Brócolis',
  address: 'Rua Visconde de Pirajá, 550 - Ipanema/Rio de Janeiro',
  description: 'Banca tradicional de verduras',
  user: user
 )

Shop.create!(
  name: 'La Fruteria',
  address: 'Rua Visconde de Pirajá, 300 - Ipanema/Rio de Janeiro',
  description: 'Banca especializada em frutas e produtos de primeira linha',
  user: user
 )

Shop.create!(
  name: 'Banca do Seu Gil',
  address: 'Rua Visconde de Pirajá, 575 - Ipanema/Rio de Janeiro',
  description: 'Banca mais antiga do Rio de Janeiro, vende frutas e legumes',
  user: user
 )


Product.create!(
  name: "Banana",
  description: "meia duzia de bananas",
  shop_id: shop.id,
  price: 3,
  category: "frutas"
  )

Product.create!(
  name: "Brócolis",
  description: "unidade",
  shop_id: shop.id,
  price: 3,
  category: "vegetal"
  )

Product.create!(
  name: "Maçã",
  description: "2kg",
  shop_id: shop.id,
  price: 3,
  category: "Frutas"
  )

Product.create!(
  name: "Cenoura",
  description: "1kg",
  shop_id: shop.id,
  price: 3,
  category: "legumes"
  )

Product.create!(
  name: "Batata",
  description: "1kg",
  shop_id: shop.id,
  price: 3,
  category: "legumes"
  )
