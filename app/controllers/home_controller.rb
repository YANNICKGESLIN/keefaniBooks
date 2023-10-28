class HomeController < ApplicationController

  def index
  end
  #Ex:- :default =>''

   def destroy
    book = Book.find(params[:id])
    book.destroy

    flash[:notice] = "Le livre a été supprimé avec succès."
    redirect_to books_path
  end

  private

  def book_params
    params.fetch(:book, {}).permit(:titre, :auteur, :genre, :annee_publication, :exemplaires_disponibles, :isbn, :image)
  end

end
