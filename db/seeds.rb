puts "Drop th DB"
Dose.destroy_all
Cocktail.destroy_all
Ingredient.destroy_all
puts "DB cleared"
puts "lets create some ingredients"
Ingredient.create(name: "lemon")
Ingredient.create(name: "ice")
Ingredient.create(name: "mint leaves")
puts "#{Ingredient.all.length} ingredients has been created"

puts "Lets create some cocktails"
(0..25).to_a.sample.times do
  cocktail = Cocktail.new
  cocktail.name = "cocktail #{('a'..'z').to_a.sample.capitalize}"
  if cocktail.save
    (0..10).to_a.sample.times do
      dose = Dose.new
      dose.ingredient = Ingredient.all.sample
      dose.cocktail = cocktail
      dose.description = "take some #{dose.ingredient.name} and put it in the glass"
      dose.save
    end
    puts "#{cocktail.name} recipe has been created"
  end
end
puts "#{Cocktail.all.length} cocktails has been created"


