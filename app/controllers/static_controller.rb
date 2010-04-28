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
    @images = Photo.all :limit => 10, :order => "preferred DESC"
  end
end
