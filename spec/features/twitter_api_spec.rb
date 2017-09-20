require 'rails_helper'
require 'helper_methods.rb'

RSpec.feature "Twitter Api", type: :feature do

	scenario "it shows header for the trending topics" do
		visit "/"
		expect(page).to have_content("Twitter trends")
	end

	scenario "it shows up to 10 trends of Twitter" do
		visit "/"
		expect(page).to have_content("Will 1\nRolando 2")
	end

end