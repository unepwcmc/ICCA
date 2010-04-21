class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end
  
  def show
    @photo = Photo.find(params[:id])
  end
  
  def new
    @photo = Photo.new
    if params[:type].present?
      @photoable = params[:type].classify.constantize.all
      @photo.photoable_id = params[:id]
      @photo.photoable_type = params[:type].classify
    end
  end
  
  def create
    @photo = Photo.new(params[:photo])
    if @photo.save
      flash[:notice] = "Successfully created photo."
      redirect_to @photo
    else
      render :action => 'new'
    end
  end
  
  def edit
    @photo = Photo.find(params[:id])
  end
  
  def update
    @photo = Photo.find(params[:id])
    debugger
    if @photo.update_attributes(params[:photo])
      flash[:notice] = "Successfully updated photo."
      redirect_to @photo
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:notice] = "Successfully destroyed photo."
    redirect_to photos_url
  end
end
