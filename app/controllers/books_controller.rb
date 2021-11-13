class BooksController < ApplicationController

  def new
  @book = Book.new
  end

  def create
   @book = Book.new(book_params)
   @book.user_id = current_user.id
   @book.save
   if @book.save
    flash[:notice] = 'You have created book successfully.'
    redirect_to '/users/show'
   else
    render :new
   end
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.update
     flash[:notice] = 'You have updated book successfully.'
    end
    redirect_to '/users/show'
  end

  def index
   @books = Book.all
  end

  def edit
   @book = Book.find(params[:id])
  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy
  @book = Book.find(params[:id])
  @book.destroy
  redirect_to 'book#index'
  end

   private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
