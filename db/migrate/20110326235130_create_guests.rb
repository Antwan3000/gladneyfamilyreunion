class CreateGuests < ActiveRecord::Migration
  def self.up
    create_table :guests do |t|
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :age_range, :null => false
      t.string :shirt_size
      t.references :registrant

      t.timestamps
    end
  end

  def self.down
    drop_table :guests
  end
end
