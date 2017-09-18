require 'rails_helper'

RSpec.feature "Profile", type: :feature do
  scenario "Can enter name and date of birth" do
    visit "/profile/new"
    fill_in "Name", with: "Hands Waterbottle"
    fill_in "Date of Birth", with: "01/12/1978"
    click_button "Submit"
    # current_path.should == "/profile_page"
    expect(page.current_path).to be "/profile"
    expect(page).to have_content("Hands Waterbottle")
  end
end
