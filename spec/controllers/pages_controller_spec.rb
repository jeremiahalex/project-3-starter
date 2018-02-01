require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end
  end


  describe "GET #about" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end
  end


  describe "GET #massage" do
    it "returns http success" do
      get :massage
      expect(response).to have_http_status(:success)
    end
  end


  describe "GET #facial" do
    it "returns http success" do
      get :facial
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #hair" do
    it "returns http success" do
      get :hair
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #shave" do
    it "returns http success" do
      get :shave
      expect(response).to have_http_status(:success)
    end
  end


  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end


  describe "GET #login" do
    it "returns http success" do
      get :login
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #signup" do
    it "returns http success" do
      get :signup
      expect(response).to have_http_status(:success)
    end
  end

end