class CreateDailies < ActiveRecord::Migration[5.2]
  def change
    create_table :dailies do |t|
      t.integer :ds_hour
      t.integer :ds_minute
      t.integer :de_hour
      t.integer :de_minute
      t.text :diary
      t.timestamps
    end
  end
end
