class UserController < ApplicationController
  
  layout 'mylayout'

  def index
    @users = User.sorted_id
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "user created successfully."
      redirect_to(:controller => 'access', :action => 'login')
    else
      render('new')
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = "user updated successfully."
      redirect_to(:action => 'show', :id => @user.id)
    else
      render('edit')
    end
  end

  def delete
    @user = User.find(params[:id])
  end

  def destroy
    user = User.find(params[:id]).destroy
    flash[:notice] = "user destroyed successfully."
    redirect_to(:action => 'index')
  end


  private

    def user_params
      params.require(:user).permit(:name, :username, :password)
    end
end
