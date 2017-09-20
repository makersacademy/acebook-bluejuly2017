require 'rails_helper'

RSpec.describe "random_images/show", type: :view do
  before(:each) do
    @random_image = assign(:random_image, RandomImage.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
