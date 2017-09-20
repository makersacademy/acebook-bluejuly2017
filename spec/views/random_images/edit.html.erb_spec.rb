require 'rails_helper'

RSpec.describe "random_images/edit", type: :view do
  before(:each) do
    @random_image = assign(:random_image, RandomImage.create!())
  end

  it "renders the edit random_image form" do
    render

    assert_select "form[action=?][method=?]", random_image_path(@random_image), "post" do
    end
  end
end
