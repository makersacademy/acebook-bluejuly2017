require 'rails_helper'

RSpec.describe "random_images/new", type: :view do
  before(:each) do
    assign(:random_image, RandomImage.new())
  end

  it "renders new random_image form" do
    render

    assert_select "form[action=?][method=?]", random_images_path, "post" do
    end
  end
end
