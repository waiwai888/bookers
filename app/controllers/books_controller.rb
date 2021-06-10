class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end


  def create
    book = Book.new(book_params)
    if book.save
      flash[:notice] = "successfully"
      redirect_to book_path(book.id)
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  
private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end