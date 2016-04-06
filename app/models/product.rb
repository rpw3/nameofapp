class Product < ActiveRecord::Base
	belongs_to :product
end

class Product < ActiveRecord::Base
	has_many :orders
	has_many :comments
end		

