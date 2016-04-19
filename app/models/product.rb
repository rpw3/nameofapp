class Product < ActiveRecord::Base
	belongs_to :product
	has_many :orders
	has_many :comments

	def average_rating
		comments.average(:rating).to_f
	end	

	validates :name, presence: true
		validates :description, presence: true
		validates :text, presence: true
		validates :image_url, presence: true
		validates :color, presence: true
end