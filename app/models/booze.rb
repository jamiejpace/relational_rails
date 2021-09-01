class Booze < ApplicationRecord
  belongs_to :manufacturer

  def self.is_clear?
    where(clear: true)
  end

  def self.abv_threshold(num)
    num = 0 if num == ''
    where("abv > #{num}")
  end
end
