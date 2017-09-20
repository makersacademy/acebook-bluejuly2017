require 'rails_helper'

RSpec.describe "random_images/index", type: :view do
  before(:each) do
    assign(:random_images, [
      RandomImage.create!(),
      RandomImage.create!()
    ])
  end

  it "renders a list of random_images" do
    render
  end
end
