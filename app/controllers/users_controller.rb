class UsersController < ApplicationController
  load_and_authorize_resource
  # GET /users
  # GET /users.xml
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new
    @images = Photo.all :limit => 10

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])
    
    respond_to do |format|
      if @user.save
        

        flash[:notice] = "Thank you #{@user.username}, you are now logged in"
        format.html { redirect_to(contribute_path) }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        @images = Photo.all :limit => 10
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User was successfully updated.'
        format.html { redirect_to(root_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end

  def make_user_admin
    @user = User.find params[:id]
    @admin_role = Role.find :first, :conditions => {:name => "admin"}
    @admin_role ||= Role.create({:name => "admin"})
    @user.role = @admin_role
    if @user.save!
      flash[:notice] = "Made user admin"
      redirect_to @user
    else
      flash[:notice] = "Unable to make user admin"
      redirect_to users_path
    end
  end

  def forgot_password
    @user_session = UserSession.new unless current_user
  end

  def reset_password
    email = params[:email]
    @user = User.find(:first, :conditions => "email = '#{email}'")
    if @user.nil?
      flash[:notice] = "Unable to find user with email address '" + email + "'"
      redirect_to :forgot_password
    else
      new_password = ActiveSupport::SecureRandom.base64()
      @user.password = new_password
      @user.password_confirmation = new_password
      if @user.save
        Emailer.deliver_mail_user_new_password(@user, new_password)
        flash[:notice] = "Password reset and email sent to " + email
        UserSession.find.destroy
        redirect_to contribute_path
      else
        flash[:notice] = "Something went wrong and we were unable to reset your password, please try again, or contact us"
        redirect_to :forgot_password
      end
    end
  end
end
