class StaticController < ApplicationController
  def home
  end

  def about
    get_some_images
  end

  def faqs
    get_some_images
  end

  def contact
  end

  private
  def get_some_images
    @images = Photo.all :limit => 10
  end
end
