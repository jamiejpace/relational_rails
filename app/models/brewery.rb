class Brewery < ActiveRecord::Base
  has_many :brews

  def tropical?
    if name.downcase.include? 'tropical'
      return true
    # elsif description.downcase.include?  'laundry'
    #   return true
    else
      return false
    end
  end
end
