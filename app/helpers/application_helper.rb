module ApplicationHelper
  def monetary (total)
    number_to_currency(total)
  end
  
  def telephone(number)
    number_to_phone(number, :area_code => true)
  end
  
  def total_attendance
    Registrant.count + Guest.count
  end
end
