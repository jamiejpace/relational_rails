require 'rails_helper'

RSpec.describe Booze, type: :model do
  describe 'relationships' do
    it {should belong_to(:manufacturer)}
  end
end
