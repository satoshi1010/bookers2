class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
    redirect_to user_path(@user.id), success: 'Welcome! You have signed up successfully.'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end

  def show
     @user = User.find(params[:id])
     @post_images = @user.post_images.page(params[:page]).reverse_order
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.update
      flash[:notice] = 'You have updated user successfully.' 
    end
    redirect_to user_path(@user.id)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
