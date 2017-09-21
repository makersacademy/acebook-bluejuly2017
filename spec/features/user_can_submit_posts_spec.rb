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
    latest_post_id = Post.last.id
    click_link("Like")
    expect(page).to have_content ("1 like this")
  end

  scenario "Posts are in reverse order" do
    add_message('Message 2')
    time2 = format_time_and_date(Time.now.utc)
    like_message = "0 like this Like Unlike"
    message1_string = "Message 1 #{@time1}"
    message2_string = "Message 2 #{time2}"
    expect(page).to have_content("#{message2_string} #{like_message} #{message1_string} #{like_message} ")
  end


end
