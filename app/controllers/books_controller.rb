class BooksController < ApplicationController
  def top
  end

  def index
  	@books = Book.all
  	@book = Book.new
  end
  def create
  	book = Book.new(book_params)
  	if book.save
  		redirect_to "/books/#{book.id}", notice: 'book was successfully created.'
    else
      redirect_to "/books", notice: "error. form can't be blank."
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
  		redirect_to "/books/#{book.id}", notice: 'book was successfully updated.'
    else
      redirect_to "/books/#{book.id}/edit", notice: "error. form can't be blank."
  	end
  end

  def destroy
  	book = Book.find(params[:id])
  	if book.destroy
  	  redirect_to "/books", notice: 'book was successfully destroyed.'
  	end
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end

end
