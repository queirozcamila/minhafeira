require 'uri'
OpenURI::Buffer.send :remove_const, 'StringMax' if OpenURI::Buffer.const_defined?('StringMax')
OpenURI::Buffer.const_set 'StringMax', 0

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Destroying last seeded"
CartProduct.destroy_all
Cart.destroy_all
User.destroy_all
Shop.destroy_all
Product.destroy_all

puts "Generating users"

user_one = User.create!(
  email: "user@gmail.com",
  password: "123456789",
  )

url = "https://res.cloudinary.com/ddvehsujc/image/upload/v1589500924/punk_user_zu5n2y.jpg"
filename = File.basename(URI.parse(url).path)
file = URI.open(url)
user_one.photo.attach(io: file, filename: filename)
user_one.save!

user_two = User.create!(
  email: "user2@gmail.com",
  password: "123456789",
)

url = "https://res.cloudinary.com/ddvehsujc/image/upload/v1589500923/ruth_user_mumt6r.jpg"
filename = File.basename(URI.parse(url).path)
file = URI.open(url)
user_two.photo.attach(io: file, filename: filename)
user_two.save!

puts "Generating Shops"

mister = Shop.create!(
  name: 'Mister orgânicos',
  address: 'Rua Visconde de Pirajá, 120 - Ipanema/Rio de Janeiro',
  description: 'Banca de produtos orgânicos',
  user: user_two,
  category: "Orgânicos"
  # latitude: -22.982234699999996,
  # longitude: -43.199285499999995
 )

url = "https://res.cloudinary.com/ddvehsujc/image/upload/v1589391225/ma99zoxw4ceoi1252c2hbagefo2i.jpg"
filename = File.basename(URI.parse(url).path)
file = URI.open(url)
mister.photo.attach(io: file, filename: filename)
mister.save!

frutascom = Shop.create!(
  name: 'Frutas.com',
  address: 'Rua Gomes Carneiro, 75 - Ipanema/Rio de Janeiro',
  description: 'Banca especializada em frutas frescas.',
  user: user_one,
  category: "Frutas"
 )

url = "https://media.gazetadopovo.com.br/viver-bem/2019/09/frutas-emagrecer-768x512-7ce407e0.jpg"
filename = File.basename(URI.parse(url).path)
file = URI.open(url)
frutascom.photo.attach(io: file, filename: filename)
frutascom.save!

srbrocolis = Shop.create!(
  name: 'Sr. Brócolis',
  address: 'Rua Visconde de Pirajá, 550 - Ipanema/Rio de Janeiro',
  description: 'Banca tradicional de verduras.',
  user: user_two,
  category: "Verduras"
 )

url = "https://res.cloudinary.com/ddvehsujc/image/upload/v1589500791/senhorbrocolis_jtqla3.jpg"
filename = File.basename(URI.parse(url).path)
file = URI.open(url)
srbrocolis.photo.attach(io: file, filename: filename)
srbrocolis.save!

lafruteria = Shop.create!(
  name: 'La Fruteria',
  address: 'Rua Visconde de Pirajá, 300 - Ipanema/Rio de Janeiro',
  description: 'Banca especializada em frutas e produtos de primeira linha.',
  user: user_two,
  category: "Frutas"
)

url = "https://www.receiteria.com.br/wp-content/uploads/receitas-de-sorbet-1-730x449.jpg"
filename = File.basename(URI.parse(url).path)
file = URI.open(url)
lafruteria.photo.attach(io: file, filename: filename)
lafruteria.save!

seugil = Shop.create!(
  name: 'Banca do Seu Gil',
  address: 'Rua Visconde de Pirajá, 575 - Ipanema/Rio de Janeiro',
  description: 'Banca mais antiga do Rio de Janeiro, vende frutas e legumes.',
  user: user_one,
  category: "Legumes"
 )

url = "https://publisher-publish.s3.eu-central-1.amazonaws.com/pb-brasil247/swp/jtjeq9/media/20190521170512_fb1f9b90f81ff2dab444be30a155347fe76c67f37b3331605d3cbc69464221fa.jpeg"
filename = File.basename(URI.parse(url).path)
file = URI.open(url)
seugil.photo.attach(io: file, filename: filename)
seugil.save!

puts "Generating Products"

banana = Product.create!(
  name: "Banana",
  description: "Meia duzia de bananas",
  shop: Shop.all.sample,
  price: 3,
  category: "Frutas"
  )

url = "https://res.cloudinary.com/ddvehsujc/image/upload/v1589500921/banana_zligyu.jpg"
filename = File.basename(URI.parse(url).path)
file = URI.open(url)
banana.photo.attach(io: file, filename: filename)
banana.save!

brocolis = Product.create!(
  name: "Brócolis",
  description: "Unidade",
  shop: Shop.all.sample,
  price: 3,
  category: "Vegetais"
  )

url = "https://res.cloudinary.com/ddvehsujc/image/upload/v1589500792/brocolis_sczw6w.jpg"
filename = File.basename(URI.parse(url).path)
file = URI.open(url)
brocolis.photo.attach(io: file, filename: filename)
brocolis.save!

maca = Product.create!(
  name: "Maçã",
  description: "1kg",
  shop: Shop.all.sample,
  price: 3,
  category: "Frutas"
  )

url = "https://res.cloudinary.com/ddvehsujc/image/upload/v1589500794/maca_ohptlm.jpg"
filename = File.basename(URI.parse(url).path)
file = URI.open(url)
maca.photo.attach(io: file, filename: filename)
maca.save!

cenoura = Product.create!(
  name: "Cenoura",
  description: "1kg",
  shop: Shop.all.sample,
  price: 3,
  category: "Legumes"
  )

url = "https://res.cloudinary.com/ddvehsujc/image/upload/v1589500795/cenoura_wccd8a.jpg"
filename = File.basename(URI.parse(url).path)
file = URI.open(url)
cenoura.photo.attach(io: file, filename: filename)
cenoura.save!

batata = Product.create!(
  name: "Batata",
  description: "1kg",
  shop: Shop.all.sample,
  price: 3,
  category: "Legumes"
  )

url = "https://img.freepik.com/fotos-gratis/batata-crua-isolada-no-fundo-branco-com-tracado-de-recorte_88281-1368.jpg?size=626&ext=jpg"
filename = File.basename(URI.parse(url).path)
file = URI.open(url)
batata.photo.attach(io: file, filename: filename)
batata.save!

puts "It's done!"
