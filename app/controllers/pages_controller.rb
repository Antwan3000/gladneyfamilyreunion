class PagesController < ApplicationController
  caches_page :home, :contact, :letter, :hotel, :schedule
  
  def home
  end

  def contact
  end
  
  def letter
  end
  
  def hotel
  end
  
  def schedule
  end

end
