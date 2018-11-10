class CreatePalettes < ActiveRecord::Migration[5.2]
  def change
    create_table :palettes do |t|
      t.belongs_to :user
      t.string :color

      t.timestamps
    end
  end
end
