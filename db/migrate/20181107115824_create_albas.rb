class CreateAlbas < ActiveRecord::Migration[5.2]
  def change
    create_table :albas do |t|
      t.string :name
      t.integer :money_hour, :default=> 0
      t.string :place
      t.integer :s_hour, :default => 0
      t.integer :s_minute, :default => 0
      t.integer :e_hour, :default => 0
      t.integer :e_minute, :default => 0
      t.boolean :nightbonus, :default => false
      t.boolean :weekbonus, :default => false
      t.boolean :holidaybonus, :default => false
      t.boolean :extendbonus, :default => false
      t.boolean :tax, :default => false
      t.string :color
      t.integer :final2, :default =>0
      t.integer :final, :default =>0
      t.integer :distinguish
      t.integer :dateDistinguish
      t.integer :user_distinguish
      # count 구별
      t.boolean :picked, :default=> false
      
      
      t.timestamps
    end
  end
end
