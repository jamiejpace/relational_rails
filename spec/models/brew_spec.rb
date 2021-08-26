require 'rails_helper'

RSpec.describe Brew, type: :model do
  describe 'relationships' do
    it {should belong_to(:brewery)}
  end
end
