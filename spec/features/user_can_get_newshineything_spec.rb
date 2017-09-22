require 'rails_helper'
require 'helper_methods.rb'
require "support/features/clearance_helpers"

RSpec.feature "Shiney Thing Generator", type: :feature do

  before(:each) do
    sign_in
    visit "/posts"
  end

  scenario "You are redirected to the random new thing generator" do
    click_button "generator"
    expect(page).to eq(newshineything_url)
   end

end
