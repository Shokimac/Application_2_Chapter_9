class BooksController < ApplicationController

  def index
    @books = Book.all
    @newbook = Book.new
    @user = current_user
    @users = User.all
  end

  def show
    @book = Book.find(params[:id])
    @user = current_user
    @newbook = Book.new
  end
  
  def create
    @newbook = Book.new(book_params)
    @newbook.user_id = current_user.id
    if @newbook.save
      redirect_to book_path(@newbook.id), notice:'You have creatad book successfully.'
    else
      @newbook.errors.full_messages
      @books = Book.all
      @user = current_user
      @users = User.all
      render :index
    end
    
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user_id != current_user.id
      redirect_to books_path
    else
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book.id), notice:'You have updated book successfully.'
    else
      @book.errors.full_messages
      render :edit
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

def book_params
    params.require(:book).permit(:title, :body)
end
  
end
