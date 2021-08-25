class CreateBrews < ActiveRecord::Migration[5.2]
  def change
    create_table :brews do |t|
      t.string :name
      t.float :abv
      t.string :type
      t.boolean :gluten_free
      t.boolean :on_tap
      t.references :brewery, foreign_key: true

      t.timestamps
    end
  end
end
