require 'rails_helper'
require 'helper_methods.rb'

RSpec.feature "Timeline", type: :feature do

  scenario "button on posts page for user profile" do
    # expect(page).to have_selector("input[type=submit]")
    page.find("#submitButton").visible?

    # expect(page).to have_button("Profile")
  end
end
