class Category < ApplicationRecord
  #setting up the table products with a foreign key to table category
  has_many :products
  
  #def self.import(file)
  #  CSV.foreach(file.path, headers: true) do |row|
  #    Users.create! row.to_hash
  #  end
  #end
end
