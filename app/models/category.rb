class Category < ApplicationRecord
  #setting up the table products with a foreign key to table category
  has_many :products
end
