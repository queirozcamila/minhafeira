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
  photo: url("https://i.pinimg.com/originals/50/ed/86/50ed86456d535bdf6dfee9af05e15d99.jpg")
  )

user_two = User.create!(
  email: "user2@gmail.com",
  password: "123456789",
  photo: url("https://www.museudememes.com.br/wp-content/uploads/2018/04/Ruth_Lemos.png")
)

shop = Shop.create!(
  name: 'Mister orgânicos',
  address: 'Rua Visconde de Pirajá, 120 - Ipanema/Rio de Janeiro',
  description: 'Banca de produtos orgânicos',
  user: user,
  photo: url("https://www.adiaesp.com.br/site/wp-content/uploads/2017/07/alimentos-organicos-1200x800-420x310.jpg")
  # latitude: -22.982234699999996,
  # longitude: -43.199285499999995
 )

Shop.create!(
  name: 'Frutas.com',
  address: 'Rua Gomes Carneiro, 75 - Ipanema/Rio de Janeiro',
  description: 'Banca especializada em frutas frescas.',
  user: user,
  photo: url("https://img.itdg.com.br/tdg/images/blog/uploads/2020/02/Como-retardar-o-amadurecimento-das-frutas.jpg")
 )

Shop.create!(
  name: 'Sr. Brócolis',
  address: 'Rua Visconde de Pirajá, 550 - Ipanema/Rio de Janeiro',
  description: 'Banca tradicional de verduras.',
  user: user,
  photo: url("https://i2.wp.com/www.ichthusmanaus.com.br/wp-content/uploads/2019/03/Br%C3%B3colis.jpg")
 )

Shop.create!(
  name: 'La Fruteria',
  address: 'Rua Visconde de Pirajá, 300 - Ipanema/Rio de Janeiro',
  description: 'Banca especializada em frutas e produtos de primeira linha.',
  user: user,
  photo: url("https://s2.glbimg.com/xrQGkcUINRFc36w--uO0oDySHRo=/512x320/smart/e.glbimg.com/og/ed/f/original/2016/01/24/cc47_aopontosaudavel_06a.jpg")
 )

Shop.create!(
  name: 'Banca do Seu Gil',
  address: 'Rua Visconde de Pirajá, 575 - Ipanema/Rio de Janeiro',
  description: 'Banca mais antiga do Rio de Janeiro, vende frutas e legumes.',
  user: user,
  photo: url("https://upload.wikimedia.org/wikipedia/commons/6/65/Gilberto_Gil_1719MC198.jpg")
 )


Product.create!(
  name: "Banana",
  description: "Meia duzia de bananas",
  shop_id: shop.id,
  price: 3,
  category: "Frutas",
  photo: url("https://upload.wikimedia.org/wikipedia/commons/8/8a/Banana-Single.jpg")
  )

Product.create!(
  name: "Brócolis",
  description: "Unidade",
  shop_id: shop.id,
  price: 3,
  category: "Vegetais",
  photo: url("https://tempodecozimento.com.br/wp-content/uploads/2017/10/br%C3%B3colis.jpg")
  )

Product.create!(
  name: "Maçã",
  description: "1kg",
  shop_id: shop.id,
  price: 3,
  category: "Frutas",
  photo: url("https://d26lpennugtm8s.cloudfront.net/stores/746/397/products/maca-argentina1-a86acef532d11addf315221676880019-480-0.jpg")
  )

Product.create!(
  name: "Cenoura",
  description: "1kg",
  shop_id: shop.id,
  price: 3,
  category: "Legumes",
  photo: url("https://d26lpennugtm8s.cloudfront.net/stores/746/397/products/cenoura-semrama1-d884e62b40d965d1a215220503425521-640-0.jpg")
  )

Product.create!(
  name: "Batata",
  description: "1kg",
  shop_id: shop.id,
  price: 3,
  category: "Legumes",
  photo: url("https://cdn.garciasupermercados.com.br/media/catalog/product/cache/1/image/1000x1000/17f82f742ffe127f42dca9de82fb58b1/p/r/produto_341_batata_inglesa_copy_.jpg")
  )
