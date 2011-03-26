class PagesController < ApplicationController
  caches_page :home, :contact
  
  def home
    @page_layout = 'three-column'
  end

  def contact
  end

end
