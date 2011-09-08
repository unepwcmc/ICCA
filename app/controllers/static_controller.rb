class StaticController < ApplicationController
  before_filter :get_some_images
  def home
    @content = StaticContent.find_by_content_for "home"
  end

  def about
    @content = StaticContent.find_by_content_for "about"
  end

  def faqs
    @content = StaticContent.find_by_content_for "faqs"
  end

  def contact
    @content = StaticContent.find_by_content_for "contact"
  end

  def contribute
  end

  def acknowledgements
  end

  def project
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
