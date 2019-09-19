class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
        @book = Book.new
        @books = Book.all
        @user = User.find(params[:id])
  end

  def edit
      @user = User.find(params[:id])
  end



  def index
       @book = Book.new
       @users = User.all
       @user = current_user
  end



  def  create
  		  user = User.new(user_params)
  	if @user.save
       flash[:notice] = "successfully"
       redirect_to book_path(@book.id)
   else
      @books =Book.all
      @user = current_user
      render :show
    end
  end

  def update
        @user = User.find(params[:id])
    if  @user.update(user_params)
       flash[:notice] = "successfully"
       redirect_to user_path(@user.id)
    else
        render :edit
    end
  end






  private
    def user_params
		params.require(:user).permit(:name,:introduction,:profile_image)
    end




end
