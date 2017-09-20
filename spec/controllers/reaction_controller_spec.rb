require 'rails_helper'

RSpec.describe ReactionController, type: :controller do
  describe "GET /new " do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    it "responds with 200" do
      reaction :create, params: { reaction: { name: "NaN" } }
      expect(response).to redirect_to(posts_url)
    end

    it "creates a post" do
      reaction :create, params: { reaction: { name: "NaN" } }
      expect(Reaction.find_by(name: "NaN")).to be
    end
  end

  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
