class Guest < ActiveRecord::Base
  belongs_to :registrant
  
  attr_accessible :first_name, :last_name, :age_range, :shirt_size
  
  AGE = { "Adult 13 and Up"   =>  {:label => "$20 - Age 13 & Up", :price => 20.00},
          "Child 8-12"        =>  {:label => "$10 - Age 8-12", :price  => 10.00},
          "Child 7 and Under" =>  {:label => "Free - Age 7 & Below", :price  => 0.00}}
  
  validates :first_name, :presence => true, :length => { :maximum => 30 }
  validates :last_name, :presence => true, :length => { :maximum => 30 }
  validates :age_range, :inclusion => { :in => AGE.keys }
  validates :shirt_size, :presence => true, :inclusion => {:in => Registrant::SHIRTS.keys}
  
  def self.age_select_options
    AGE.keys.collect { |k| [AGE[k][:label], k] }
  end
  
end
