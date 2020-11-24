# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

p " ********************************* "
p " *                               * "
p " *         BEGIN OF SEED         * "
p " *                               * "
p " ********************************* "

p "Destroy curent data..."

p "Destroying Product... #{Product.count} "
Product.destroy_all
p "-----------------------"
p "-----------------------"

# Product
def generateDescription
  array = []
  i = 0
  while i < 20
    string = Faker::Movies::StarWars.quote
    if (string.length > 25 && !(array.include?(string)))
      p string
      array[i] = string
      i+=1
    end
  end
  array
end

def generateTitle
  array = []
  i = 0
  while i < 20
    title = Faker::Movies::StarWars.character
    if !(array.include?(title))
      p title
      array[i] = title
      i+=1
    end
  end
  array
end

def generateAvatar
  array = []
  i = 0
  while i < 20
    title = Faker::Avatar.image(format: "png", set: "set4")
    if !(array.include?(title))
      p title
      array[i] = title
      i+=1
    end
  end
  array
end

titles = generateTitle
avatars = generateAvatar
descriptions = generateDescription
20.times do |n|
  product = Product.create!(
    title: titles[n],
    description: descriptions[n],
    price: rand(1..400)
  )
  product.image.attach(io: open(avatars[n]), filename: 'image.png')
end
puts "#{tp Product.all}"
p "Creation Users... #{Product.count}"
puts "DONE"
p "-----------------------"
p "-----------------------"

p " ********************************* "
p " *                               * "
p " *          END OF SEED          * "
p " *                               * "
p " ********************************* "
