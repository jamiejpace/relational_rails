class Brew < ApplicationRecord
  belongs_to :brewery

  def self.is_on_tap
    where(on_tap: true)
  end
end
