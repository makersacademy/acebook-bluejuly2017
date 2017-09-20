require 'rails_helper'

RSpec.describe "friends/index", type: :view do
  before(:each) do
    assign(:friends, [
      Friend.create!(
        :title => "Title",
        :body => "MyText"
      ),
      Friend.create!(
        :title => "Title",
        :body => "MyText"
      )
    ])
  end

  it "renders a list of friends" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
