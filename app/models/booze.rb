class Booze < ApplicationRecord
  belongs_to :manufacturer

  def self.is_clear?
    where(clear: true)
  end
end
