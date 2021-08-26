require 'rails_helper'

RSpec.describe Manufacturer, type: :model do
  describe 'relationships' do
    it {should have_many(:boozes)}
  end
end
