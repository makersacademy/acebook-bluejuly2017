require 'rails_helper'

RSpec.describe "Photos", type: :request do
  describe "GET /photos" do

    it "has photos path" do
      get photos_path
      expect(response).to have_http_status(200)
    end
  end
end
