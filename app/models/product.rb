class Product < ActiveRecord::Base
	belongs_to :product
	has_many :orders
	has_many :comments

	def average_rating
		comments.average(:rating).to_f
	end	

	validates :name, presence: true
		validates :user, presence:true
		validates :product, presence:true
		validates :rating, numericality: { only_integer: true}
end