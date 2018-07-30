require 'rails_helper'

RSpec.describe FriendsController, type: :controller do

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #approve" do
    it "returns http success" do
      get :approve
      expect(response).to have_http_status(:success)
    end
  end

end
