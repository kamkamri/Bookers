class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all

  end

  def create
    # 1.2データを受け取り、インスタンス変数に保存
    book = Book.new(book_params)
    # 3.データベースを保存するためのsaveメソッド
    book.save
    # 4。index画面へリダイレクト
    redirect_to book_path(book.id)
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
