class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    if book.save
      flash[:success] = "success"
      redirect_to book_path(book.id)
    else
      flash.now[:danger] = "faild"
      redirect_to book_path(book.id)
      render :show
    end
  end
  
  def show
    @book = Book.find(params[:id])
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:success] = "success"
      redirect_to book_path(book.id)
    else
      flash.now[:danger] = "faild"
      redirect_to book_path(book.id)
      render :show
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    if book.destroy
      flash[:success] = "success"
      redirect_to book_path(book.id)
    else
      flash.now[:danger] = "faild"
      redirect_to book_path(book.id)
      render :show
    end
  end
  
private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end