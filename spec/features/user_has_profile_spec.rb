require 'rails_helper'
require 'helper_methods.rb'
require "support/features/clearance_helpers"

RSpec.feature "Profile", type: :feature do

  describe "User is not signed in" do

    before(:each) do
      visit "/posts"
    end

    scenario "user cannot see profile button" do
      expect(page).not_to have_selector('input[type=submit][value="Profile"]')
    end
  end

  describe "User is signed in" do

    before(:each) do
      sign_in
    end

    scenario "button on posts page for user profile" do
      expect(page).to have_selector('button[type=submit][value="Profile"]')
    end

    scenario "user clicks profile button and is taken to profile page" do
      click_link("Profile")
      expect(page).to have_content('Hello')
    end
  end

end
