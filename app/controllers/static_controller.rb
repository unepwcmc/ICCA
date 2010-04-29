class StaticController < ApplicationController
  before_filter :get_some_images
  def home
  end

  def about
  end

  def faqs
  end

  def contact
  end

  def contribute
  end

  private
  def get_some_images
    sites = Site.all :limit => 10, :order => "updated_at DESC"
    @images = []
    sites.each do |s|
      @images += s.preferred_photo
    end
  end
end
