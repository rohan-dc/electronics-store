# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'
#delete all products prior to adding
Product.delete_all()

# get all products in CSV
CSV.foreach(Rails.root.join("db/seeds_data/products.csv"), headers: true) do |row|
  Product.find_or_create_by(productID: row[0], 
                            category_id: Category.find_or_create_by(name: row[1]).id, 
                            name: row[2], 
                            price: row[3]) # convert string to number and then to currency
end