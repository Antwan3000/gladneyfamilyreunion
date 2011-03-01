class PagesController < ApplicationController
  caches_page :home, :contact
  
  def home
  end

  def contact
  end

end
