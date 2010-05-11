class StaticContentsController < ApplicationController
  load_and_authorize_resource
  

  # GET /StaticContents/new
  # GET /StaticContents/new.xml
  def new
    @static_content = StaticContent.new
  end

  # GET /StaticContents/1/edit
  def edit
    @static_content = StaticContent.find(params[:id])
  end

  # POST /StaticContents
  # POST /StaticContents.xml
  def create
    @static_content = StaticContent.new(params[:static_content])

      if @static_content.save
        flash[:notice] = 'Content was successfully created.'
        redirect_to(root_url)
      else
        render :action => "new" 
      end
  end

  # PUT /StaticContents/1
  # PUT /StaticContents/1.xml
  def update
    @static_content = StaticContent.find(params[:id])

      if @static_content.update_attributes(params[:static_content])
        flash[:notice] = 'Content was successfully updated.'
        redirect_to(root_url) 
      else
        render :action => "edit"
      end
  end

end
