class Brew < ApplicationRecord
  belongs_to :brewery

  def self.is_on_tap
    where(on_tap: true)
  end

  def self.abv_threshold(num)
    num = 0 if num == ""
    where("abv > #{num}")
  end
end
