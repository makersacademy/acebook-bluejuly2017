require 'rails_helper'

RSpec.describe "friends/show", type: :view do
  before(:each) do
    @friend = assign(:friend, Friend.create!(
      :body => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
  end
end
