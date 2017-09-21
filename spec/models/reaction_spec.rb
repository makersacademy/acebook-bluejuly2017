require 'rails_helper'

RSpec.describe Reaction, type: :model do
  it { is_expected.to be }
end

Rspec.describe Reaction, type: :model do

  it 'can add rows to the database' do
    Reaction.create
  end
  
end