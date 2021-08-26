class ChangeTypeToBeerType < ActiveRecord::Migration[5.2]
  def change
    rename_column :brews, :type, :beer_type
  end
end
