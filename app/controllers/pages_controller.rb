class PagesController < ApplicationController
  def index
  end

  def landing_page
    @dont_show_nav = true
  end

  def about
  end
end
