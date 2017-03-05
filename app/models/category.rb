class Category < ApplicationRecord
  has_many :products
  
  #def self.import(file)
  #  CSV.foreach(file.path, headers: true) do |row|
  #    Users.create! row.to_hash
  #  end
  #end
end
