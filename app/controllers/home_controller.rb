class HomeController < ApplicationController

  def index
     @book = Book.all
  end
  def destroy
      book = Book.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      # Handle the error here
    else
      book.destroy
    
      redirect_to books_path, notice: 'Book was successfully deleted.'
    end
end
