require 'rails_helper'
require 'helper_methods.rb'
require "support/features/clearance_helpers"

RSpec.feature "Timeline", type: :feature do

  before(:each) do
    sign_in
    visit "/posts"
    add_message('Message 1')
    @time1 = format_time_and_date(Time.now.utc)
  end

  scenario "Can submit posts and view them" do
    expect(page).to have_content("Message 1")
  end

  scenario "Expect post to have timestamp" do
    expect(page).to have_content("#{@time1}")
  end

  it "Posts have 'like' and 'Unlike' buttons" do
    expect(page).to have_selector(:button, 'Like')
    expect(page).to have_selector(:button, 'Unlike')
  end

  scenario "Liking posts increases the like counter" do
    click_link("Like")
    expect(page).to have_content ("1 like this")
  end

  scenario "Expect post to show hyperlink" do
    add_message('this is not a link but this is -> www.google.com')
    find_link('www.google.com').visible?
  end

  scenario "User can delete post" do
    delete_message("Message 1")
    expect(page).to_not have_content("Message 1")
  end

end
