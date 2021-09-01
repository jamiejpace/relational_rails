class Brewery < ActiveRecord::Base
  has_many :brews, dependent: :delete_all

  def self.created_at_order
    order(:created_at)
  end
end
