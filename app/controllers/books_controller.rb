class BooksController < ApplicationController
  def index
        @books = Book.all
      rescue ActiveRecord::RecordNotFound
        # Handle the error here
  end

  def show
    @book = Book.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    flash[:error] = "Book not found"
    redirect_to books_path
  end


  def new
    @book = Book.new
  end

  def create
    book_params = params.require(:book).permit(:titre, :auteur, :genre, :annee_publication, :exemplaires_disponibles, :isbn, :image)
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = "Le livre a été ajouté avec succès."
      redirect_to books_path
    else
      flash[:error] = "Une erreur est survenue lors de l'ajout du livre."
      render :new
    end
  end

  def edit
    begin
      @book = Book.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      flash[:error] = 'Livre non trouvé.'
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to books_path, notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      # Handle the error here
    else
    book.destroy
    redirect_to books_path, notice: 'Book was successfully deleted.'
  end

 private

  def book_params
    params.require(:book).permit(:titre, :auteur, :genre, :annee_publication, :exemplaires_disponibles, :isbn, :image)
  end

end

