require 'rails_helper'

RSpec.describe "RandomImages", type: :request do
  describe "GET /random_images" do
    it "works!" do
      get random_images_path
      expect(response).to have_http_status(200)
    end
    it "renders correct template" do
      get random_images_path
      expect(response).to render_template :'random_images/index'
    end
  end
end
