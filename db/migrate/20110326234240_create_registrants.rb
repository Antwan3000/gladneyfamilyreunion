class CreateRegistrants < ActiveRecord::Migration
  def self.up
    create_table :registrants do |t|
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :email, :null => false
      t.string :phone_number, :null => false
      t.string :kinship
      t.string :confirmation_num
      t.decimal :grand_total, :scale => 2
      t.string :payment_trustee, :null => false
      t.string :shirt_size
      

      t.timestamps
    end
  end

  def self.down
    drop_table :registrants
  end
end
