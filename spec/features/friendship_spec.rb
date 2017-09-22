require 'rails_helper'
require 'helper_methods.rb'

RSpec.feature "Friendships", type: :feature do

  before(:each) do
    visit "/posts"
    click_link("Sign in")
    click_link("Sign up")
    sign_up_with("test@test.com", "1234")
    sign_out
    sign_up_with("test2@test.com", "1234")
    visit "/friendships"
  end

  scenario "Can view users to add as friends" do
    expect(page).to have_content("test@test.com")
  end

  scenario "Can add friend and view them" do
    click_link ("Add Friend")
    within('div#friendships') do
      expect(page).to have_content("test@test.com")
    end
  end

  scenario "Adding friend is reciprocal" do
    click_link ("Add Friend")
    sign_out
    sign_in_with("test@test.com", "1234")
    visit "/friendships"
    within('div#friendships') do
      expect(page).to have_content("test2@test.com")
    end
  end

  scenario "Can remove friendship" do
    click_link ("Add Friend")
    click_link ('Remove Friendship')
    within('div#potential_friends') do
      expect(page).to have_content("test@test.com")
    end
    within('div#friendships') do
      expect(page).not_to have_content("test@test.com")
    end
  end

  scenario "Removing friend is reciprocal" do
    click_link ("Add Friend")
    click_link ('Remove Friendship')
    sign_out
    sign_in_with("test@test.com", "1234")
    visit "/friendships"
    within('div#potential_friends') do
      expect(page).to have_content("test2@test.com")
    end
    within('div#friendships') do
      expect(page).not_to have_content("test2@test.com")
    end
  end
end
