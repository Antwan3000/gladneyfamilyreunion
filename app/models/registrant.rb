class Registrant < ActiveRecord::Base
  
  has_one :address, :dependent => :destroy
  has_many :guests, :dependent => :destroy
  
  accepts_nested_attributes_for :address, :allow_destroy => true
  accepts_nested_attributes_for :guests, :allow_destroy => true
  
  
  attr_accessor_with_default :init_confirmed, false
  
  attr_accessible :first_name, :last_name, :email, :email_confirmation, :phone_number, :kinship, :payment_trustee, :shirt_size, :address_attributes, :guests_attributes, :init_confirmed
  
  delegate :street, :city, :state, :zipcode, :to => :address
  
  
  # Callbacks
  after_validation  :calculate_grand_total, :if => :is_valid?
  before_save        :generate_conf_num, :unless => :confirmation_exists?
  # TODO after_create :send_confirmation_email
  
  
  KINSHIP_OPTIONS = {"Decendants of James & Alice" => 
                          ["Clarence Gladney Sr.", "Curtis Gladney", "Lucille Gladney-Stephens", "Robbie Gladney-Foster", 
                           "Ruby Gladney-Knox", "Walter Gladney", "Willie Bell Gladney"], 
                     "Alternate Options" =>  
                          ["Distant Relative", "Friend of Family", "Uncertain"]}
  
  PAYMENT_TRUSTEES = { "Cheif Committee Member" => ["Marie Gladney-Robinson"], 
                       "Finance Commitee Members" => ["Tina Gladney-Gates", "Eddie Wayne Gladney"]}
                       
  TRUSTEE_ADDRESS = {"Marie Gladney-Robinson" => {:street => "7546 S. Wentworth", :city => "Chicago", :state => "IL", :zip => "60620"},
                     "Eddie Wayne Gladney" => {:street => "403 CR 103", :city => "Pittsboro", :state => "MS", :zip => "38951"},
                     "Tina Gladney-Gates" => {:street => "197 CR 161", :city => "Houlka", :state => "MS", :zip => "38850"}}
                   
  SHIRTS = { 'none'      =>  {:label => "None", :alt_label => "None", :price => 0.00},
             'small'     =>  {:label => "$12 - Small", :alt_label => "Small", :price  => 12.00},
             'medium'    =>  {:label => "$12 - Medium", :alt_label => "Medium", :price  => 12.00},
             'large'     =>  {:label => "$12 - Large", :alt_label => "Large", :price  => 12.00},
             'xlarge'    =>  {:label => "$12 - X-Large", :alt_label => "X-Large", :price  => 12.00},
             'xxlarge'   =>  {:label => "$15 - 2X-Large", :alt_label => "2X-Large", :price  => 15.00},
             'xxxlarge'  =>  {:label => "$15 - 3X-Large", :alt_label => "3X-Large", :price  => 15.00}}
  
  ALPHANUMERIC = ('A'..'H').to_a + ('K'..'N').to_a + ('P'..'Z').to_a + (0..9).to_a
  
  # Validations
  validates :first_name, :presence => true, :length => { :maximum => 30 }
  validates :last_name, :presence => true, :length => { :maximum => 30 }
  validates :email, :uniqueness => {:case_sensitive => false}, :confirmation => {:message => "should match Confirm Email Address field."}, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }
  validates :phone_number, :uniqueness => true, :numericality => {:only_integer => true}, :length => {:is => 10}
  validates :kinship, :inclusion => { :in => KINSHIP_OPTIONS.values.flatten }
  validates :payment_trustee, :inclusion => { :in => PAYMENT_TRUSTEES.values.flatten }
  validates :shirt_size, :presence => true, :inclusion => {:in => SHIRTS.keys}
  
  
  
  def init_confirmation!
    self.init_confirmed = true
  end
  
  def already_confirmed?
    self.init_confirmed
  end
  
  def confirmation_exists?
    self.confirmation_num?
  end
  
  def self.confirmation_num=(conf_num)
    confirmation_num = conf_num
  end
  
  def self.grand_total=(total)
    grand_total = total
  end
  
  def is_valid?
    self.errors.count == 0
  end
  
  def calculate_grand_total
    base_price = 20.00
    
    shirt_subtotal = SHIRTS[self.shirt_size][:price]
    
    guests_subtotal = self.guests.inject(0.00) do |total, guest|
      guest_price = Guest::AGE[guest.age_range][:price]
      guest_shirt_price = SHIRTS[guest.shirt_size][:price]
      guest_subtotal    = guest_price + guest_shirt_price
      total += guest_subtotal
    end
    
    grand_total = base_price + shirt_subtotal + guests_subtotal
    
    self.grand_total = grand_total
  end
  
  def generate_conf_num
    conf_num = random_alphanumeric
    while Registrant.where(:confirmation_num => "#{conf_num}").exists? do
      conf_num = random_alphanumeric
    end
    self.confirmation_num = conf_num
  end
  
  def self.shirt_select_options
    SHIRTS.keys.collect { |k| [SHIRTS[k][:label], k] }
  end
  
  def full_name
    first_name + " " + last_name
  end
  
  
  private
  
  # TODO 
  # def send_confirmation_email
  #   Mailer.confirmation(self).deliver
  # end
  
  def random_alphanumeric
    (1..10).collect { ALPHANUMERIC[rand(ALPHANUMERIC.size)] }.join
  end
end