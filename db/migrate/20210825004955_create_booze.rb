class CreateBooze < ActiveRecord::Migration[5.2]
  def change
    create_table :boozes do |t|
      t.string :name
      t.boolean :clear
      t.float :abv
      t.integer :proof
      t.string :booze_type
      t.references :manufacturer, foreign_key: true

      t.timestamps
    end
  end
end
