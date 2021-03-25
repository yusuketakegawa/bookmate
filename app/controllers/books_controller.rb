class BooksController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_book, only: [:show, :edit, :destroy]


  def index 
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book =Book.new(book_params)
    if @book.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @book.comments.includes(:user)
  end

  def edit
  end

  def update
  end

  def destroy
    @book.destroy
    redirect_to root_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :genre_id, :description, :image).merge(user_id: current_user.id)
  end

  def set_book
    @book = Book.find(params[:id])
  end


end
