require 'rails_helper'

describe UsersController, :type => :controller do

  before do
    @user = FactoryGirl.create(:user)
  end


  /describe "GET #show" do
    context "User is logged in" do
      before do
        sign_in @userA
      end

      it "loads correct user details" do
        get :show, id: @userA.id 
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq @userA
      end
    end
    
    context "No user is logged in" do
      it "redirects to login" do
        get :show, id: @userA.id
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end


    describe "GET #show" do
    context "User is logged in" do
      before do
        sign_in @userB
      end

      it "loads correct user details" do
        get :show, id: @userB.id 
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq @userB
      end
    end
    
    context "No user is logged in" do
      it "redirects to login" do
        get :show, id: @userB.id
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end/





end