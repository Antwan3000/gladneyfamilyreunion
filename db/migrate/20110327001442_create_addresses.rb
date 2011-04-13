class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.string :state, :limit => 2
      t.string :zipcode, :limit => 5
      t.references :registrant

      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
