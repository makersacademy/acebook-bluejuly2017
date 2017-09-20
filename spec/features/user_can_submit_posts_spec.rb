require 'rails_helper'
require 'helper_methods.rb'

RSpec.feature "Timeline", type: :feature do

  before(:each) do
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

  scenario "Posts are in reverse order" do
    add_message('Message 2')
    time2 = format_time_and_date(Time.now.utc)
    message1_string = "Message 1, created at #{@time1}"
    message2_string = "Message 2, created at #{time2}"
    expect(page).to have_content("#{message2_string} #{message1_string}")
  end
end
