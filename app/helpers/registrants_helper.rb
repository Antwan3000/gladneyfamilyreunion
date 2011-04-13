module RegistrantsHelper
  def monetary (total)
    number_to_currency(total)
  end
  
  def telephone(number)
    number_to_phone(number, :area_code => true)
  end
  
  def total_attendance
    Registrant.count + Guest.count
  end
  
  def full_name(person)
    "Full Name:  "+person.last_name+", "+person.first_name
  end
  
  def display_personal_info(person)
    "<ul id='personal-info'> \n"+
    "   <li><p>Your Full Name:</p><p>#{person.full_name}</p></li>\n"+
    "   <li><p>Your Kinship Description:</p><p>#{person.kinship}</p>\n"+
    "   <li><p>Your Shirt Size:</p><p>#{Registrant::SHIRTS[person.shirt_size][:label]}</p>\n"+
    "</ul>"
  end
  
  def display_address(address)
    "<address> \n"+
    "   <p>#{address.street}</p>\n"+
    "   <p><span class='city'>#{address.city},</span><span class='state'>#{address.state}</span><span class='zip'>#{address.zipcode}</span>\n"+
    "</address>"
  end
  
  def display_trustee_address(trustee)
    "<address id='trustee-addr'> \n"+
    "   <p>#{trustee}</p>\n"+
    "   <p>#{Registrant::TRUSTEE_ADDRESS[trustee][:street]}</p>\n"+
    "   <p><span class='city'>#{Registrant::TRUSTEE_ADDRESS[trustee][:city]},</span><span class='state'>#{Registrant::TRUSTEE_ADDRESS[trustee][:state]}</span><span class='zip'>#{Registrant::TRUSTEE_ADDRESS[trustee][:zip]}</span>\n"+
    "</address>"
  end
  
  def list_guests(guests)
    line = "<ol id='guest-list'>"
    guests.each do |g|
      line += "<li>"+
              "   <p>"+
              "      <span>#{g.first_name}&nbsp;#{g.last_name}</span>"+
              "      <span>#{Guest::AGE[g.age_range][:label]}</span>, "+
              "      <span>#{Registrant::SHIRTS[g.shirt_size][:label]}</span>"+
              "    </p>"+
              "</li>"
    end
    line += "</ol>" 
  end
end
