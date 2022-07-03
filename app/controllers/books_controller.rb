class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all

  end

  def create
    # 1.2データを受け取り、インスタンス変数に保存
    book = Book.new(book_params)
    # 3.データベースを保存するためのsaveメソッド
    if book.save
      # 4。index画面へリダイレクト
      redirect_to book_path(book.id), notice: 'Book was successfully created.'
    else
      render :index
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
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy
    # 1 受け取ったレコードをインスタンス変数に保存
    book = Book.find(params[:id])
    # 2　削除
    book.destroy
    # 3 一覧がめんへリダイレクト
    redirect_to books_url

  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
