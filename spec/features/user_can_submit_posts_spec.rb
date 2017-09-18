require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/posts"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end

  scenario "Expect post to have timestamp" do
    visit "/posts"
    time = (Time.now.utc)
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    post_time = time.strftime("%H:%M:%S")
    post_date = time.strftime("%d %b %Y")
    expect(page).to have_content("#{post_time}, #{post_date}")
  end
end
