require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  describe "GET /new" do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    it "responds with 200" do
      post :create, params: { profile: { name: "John Smith"} }
      expect(response).to redirect_to(profiles_url)
    end

    it "creates a profile" do
      post :create, params: { profile: { name: "John Smith"} }
      expect(Profile.find_by(name: "John Smith")).to be
    end
  end

  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
