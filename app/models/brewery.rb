class Brewery < ActiveRecord::Base
  has_many :brews, dependent: :delete_all
end
