require 'rails_helper'
describe Product do 
	context "when the product has comments" do
		before do
			@product = Product.create!(name:"john snow",description: "description",text:"text",image_url:"image.com")
			@user = User.create!(email: "mydomain@domain.com" , password: "mypassword")
			@product.comments.create!(rating: 1, user: @user, body: "Awful bike!")
      @product.comments.create!(rating: 3, user: @user, body: "Okay bike!")
      @product.comments.create!(rating: 5, user: @user, body: "Good bike!")	
		end

   it 'returns the average rating of all comments' do
      expect(@product.average_rating).to eq 3
    end
	
    it 'is not valid' do
      expect(Product.new(description: "Nice bike")).not_to be_valid
    end


  end

end	



  /describe Product, :type => :model do
  it "returns the average rating of all comments" do
    @user = FactoryGirl.build(:user, email: "")
    @product = FactoryGirl.build(:product,name:"",description: "",text:"",image_url:"")
    @product.comments = FactoryGirl.build(:comment,rating:"",body: "")
    expect(@product.average_rating).to eq 3
    expect(Product.new(description: "Nice bike")).not_to be_valid  
  end/