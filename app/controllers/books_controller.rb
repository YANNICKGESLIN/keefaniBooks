class BooksController < ApplicationController
   rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
   rescue_from ActionController::RoutingError, with: :routing_error

end

  def index
    @books = Book.all
  end

  def show
    # Utilisation de `before_action` pour éviter de répéter le code de recherche du livre
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      flash[:success] = "Le livre a été ajouté avec succès."
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    # Utilisation de `before_action` pour éviter de répéter le code de recherche du livre
  end

  def update
    if @book.update(book_params)
      flash[:success] = "Le livre a été mis à jour avec succès."
      redirect_to book_path(@book)
    else
      render :edit
    end
  end



  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    flash[:notice] = "Le livre a été supprimé avec succès."
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:titre, :auteur, :genre, :annee_publication, :exemplaires_disponibles, :isbn, :image)
  end

  def find_book
    @book = Book.find_by(id: params[:id])
    flash[:error] = 'Livre non trouvé.' if @book.nil?
  end
  def record_not_found
    flash[:error] = "Le livre n'a pas été trouvé."
    redirect_to books_path
  end
  def routing_error
  flash[:error] = "La page que vous essayez d'accéder n'existe pas."
  redirect_to root_path

  end
