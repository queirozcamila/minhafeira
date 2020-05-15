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

user_one = User.create!(
  email: "user@gmail.com",
  password: "123456789",
  remote_photo_url: "https://res.cloudinary.com/ddvehsujc/image/upload/v1589500924/punk_user_zu5n2y.jpg"
  )

user_two = User.create!(
  email: "user2@gmail.com",
  password: "123456789",
  remote_photo_url: "https://res.cloudinary.com/ddvehsujc/image/upload/v1589500923/ruth_user_mumt6r.jpg"
)

Shop.create!(
  name: 'Mister orgânicos',
  address: 'Rua Visconde de Pirajá, 120 - Ipanema/Rio de Janeiro',
  description: 'Banca de produtos orgânicos',
  user: user_two,
  category: "Legumes",
  remote_photo_url: "https://res.cloudinary.com/ddvehsujc/image/upload/v1589391225/ma99zoxw4ceoi1252c2hbagefo2i.jpg"
  # latitude: -22.982234699999996,
  # longitude: -43.199285499999995
 )

Shop.create!(
  name: 'Frutas.com',
  address: 'Rua Gomes Carneiro, 75 - Ipanema/Rio de Janeiro',
  description: 'Banca especializada em frutas frescas.',
  user: user_one,
  category: "Frutas",
  remote_photo_url: "https://res.cloudinary.com/ddvehsujc/image/upload/v1589393426/k478k736n81weyxqwi4ehf45iqvy.jpg"
 )

Shop.create!(
  name: 'Sr. Brócolis',
  address: 'Rua Visconde de Pirajá, 550 - Ipanema/Rio de Janeiro',
  description: 'Banca tradicional de verduras.',
  user: user_two,
  category: "Frutas",
  remote_photo_url: "https://res.cloudinary.com/ddvehsujc/image/upload/v1589500791/senhorbrocolis_jtqla3.jpg"
 )

Shop.create!(
  name: 'La Fruteria',
  address: 'Rua Visconde de Pirajá, 300 - Ipanema/Rio de Janeiro',
  description: 'Banca especializada em frutas e produtos de primeira linha.',
  user: user_two,
  category: "Verduras",
  remote_photo_url: "https://res.cloudinary.com/ddvehsujc/image/upload/v1589500792/sorbet_k8jak1.webp"
 )

Shop.create!(
  name: 'Banca do Seu Gil',
  address: 'Rua Visconde de Pirajá, 575 - Ipanema/Rio de Janeiro',
  description: 'Banca mais antiga do Rio de Janeiro, vende frutas e legumes.',
  user: user_one,
  category: "Verduras",
  remote_photo_url: "https://res.cloudinary.com/ddvehsujc/image/upload/v1589500791/gil_q6z0mb.jpg"
 )


Product.create!(
  name: "Banana",
  description: "Meia duzia de bananas",
  shop_id: shop.id,
  price: 3,
  category: "Frutas",
  remote_photo_url: "https://res.cloudinary.com/ddvehsujc/image/upload/v1589500921/banana_zligyu.jpg"
  )

Product.create!(
  name: "Brócolis",
  description: "Unidade",
  shop_id: shop.id,
  price: 3,
  category: "Vegetais",
  remote_photo_url: "https://res.cloudinary.com/ddvehsujc/image/upload/v1589500792/brocolis_sczw6w.jpg"
  )

Product.create!(
  name: "Maçã",
  description: "1kg",
  shop_id: shop.id,
  price: 3,
  category: "Frutas",
  remote_photo_url: "https://res.cloudinary.com/ddvehsujc/image/upload/v1589500794/maca_ohptlm.jpg"
  )

Product.create!(
  name: "Cenoura",
  description: "1kg",
  shop_id: shop.id,
  price: 3,
  category: "Legumes",
  remote_photo_url: "hhttps://res.cloudinary.com/ddvehsujc/image/upload/v1589500795/cenoura_wccd8a.jpg"
  )

Product.create!(
  name: "Batata",
  description: "1kg",
  shop_id: shop.id,
  price: 3,
  category: "Legumes",
  remote_photo_url: "https://res.cloudinary.com/ddvehsujc/image/upload/v1589500791/batata_wpyyw5.jpg"
  )
