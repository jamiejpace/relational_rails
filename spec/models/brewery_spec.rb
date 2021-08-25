require 'rails_helper'

RSpec.describe Brewery, type: :model do
  describe 'relationships' do
    it {should have_many(:brews)}
  end
end
