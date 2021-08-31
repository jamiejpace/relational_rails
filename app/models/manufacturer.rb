class Manufacturer < ActiveRecord::Base
  has_many :boozes, dependent: :delete_all  
end
