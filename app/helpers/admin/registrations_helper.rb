module Admin::RegistrationsHelper
  def list_size_stats
    line = ""
    Registrant::SHIRTS.each do |k, v|
      unless k == "none"
        size_count = Registrant.where(:shirt_size => k).count(:shirt_size)
        size_count += Guest.where(:shirt_size => k).count(:shirt_size)
        line += "<li style='float: left; width: 150px; list-style: none;'><span style='margin-right: 20px; padding-right: -10px'>#{v[:alt_label]} = </span><span>#{size_count}</span></li> \n"
      end
    end
    
    line.html_safe
  end
end
