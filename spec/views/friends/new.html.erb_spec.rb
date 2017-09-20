require 'rails_helper'

RSpec.describe "friends/new", type: :view do
  before(:each) do
    assign(:friend, Friend.new(
      :title => "MyString",
      :body => "MyText"
    ))
  end

  it "renders new friend form" do
    render

    assert_select "form[action=?][method=?]", friends_path, "post" do

      assert_select "input[name=?]", "friend[title]"

      assert_select "textarea[name=?]", "friend[body]"
    end
  end
end
