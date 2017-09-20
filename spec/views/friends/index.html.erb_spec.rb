require 'rails_helper'

RSpec.describe "friends/index", type: :view do
  before(:each) do
    assign(:friends, [
      Friend.create!(
        :body => "MyText"
      ),
      Friend.create!(
        :body => "MyText"
      )
    ])
  end

  it "renders a list of friends" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
