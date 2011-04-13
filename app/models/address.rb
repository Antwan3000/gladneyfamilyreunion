class Address < ActiveRecord::Base
  belongs_to :registrant
  
  validates :street, :presence => true
  validates :city, :presence => true
  validates :state, :presence => true, :length => {:is => 2}, :format => { :with => /[A-Z]+{2}/, :on => :create }
  validates :zipcode, :presence => true, :numericality => {:only_integer => true}, :length => {:is => 5}
end
