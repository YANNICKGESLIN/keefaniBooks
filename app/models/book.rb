# Importe les bibliothèques nécessaires
require 'sqlite3'

class Book < ApplicationRecord
  # Définition des attributs du modèle
  # attr_accessible :titre, :auteur, :genre
  validates :titre, presence: true

  validates :auteur, presence: true
  validates :genre, presence: true
  validates :annee_publication, presence: true
  validates :exemplaires_disponibles, presence: true
  validates :isbn, presence: true
  validates :image, presence: true
has_one_attached :image

  def image_url
    Rails.application.routes.url_helpers.rails_blob_path(image, only_path: true)
  end

 def to_s
    "#{titre} par #{auteur}"
  end
  # Méthode de recherche par titre
  def self.find_by_titre(titre)
    Book.where(titre: titre).first
  end

  # Méthode de recherche par auteur
  def self.find_by_auteur(auteur)
    Book.where(auteur: auteur).first
  end

  # Méthode de recherche par genre
  def self.find_by_genre(genre)
    Book.where(genre: genre).first
  end
  # Méthode de recherche par annee_publication
  def self.find_by_anneePublication(genre)
    Book.where(annee_publication: annee_publication).first
  end



# # Ouvre la base de données
 db = SQLite3::Database.new('biblio.sqlite3')

# Crée un livre
# book = {
#   titre: '',
#   auteur: '',
#   genre: '',
#   annee_publication: 0,
#   exemplaires_disponibles: 0,
#   isbn: 0
# }

#Crée un nouveau livre
book = Book.create(titre: "", auteur: "", genre: "", annee_publication: "",
  exemplaires_disponibles:"", isbn: "", image:"")

# Renvoie un livre par son ID
if Book.exists?(1)
  book = Book.find(1)
else
  # Le livre n'existe pas
end

# book = Book.find(1) rescue nil

# if book
#   # Le livre existe
# else
#   # Le livre n'existe pas
# end


# Renvoie une liste de tous les livres
books = Book.all



# Supprime un livre existant
# book = Book.find(1)
# book.destroy

# Utilise une requête préparée pour insérer le livre dans la table
def new
  # Vérifier si le formulaire a été soumis
  if request.method == "POST"

    # Vérifier si les données du formulaire sont valides
    book_params = params.require(:book).permit(:titre, :auteur, :genre, :annee_publication, :exemplaires_disponibles, :isbn, :image)

    # Utilise une requête préparée pour insérer le livre dans la table
    db.execute('INSERT INTO books (titre, auteur, genre, annee_publication, exemplaires_disponibles, isbn, image) VALUES (?, ?, ?, ?, ?, ?,?)',
               [book_params[:titre], book_params[:auteur], book_params[:genre], book_params[:annee_publication], book_params[:exemplaires_disponibles], book_params[:isbn], book_params[:image] ])

    redirect_to books_path
  else
    render :new
  end
end


# book_id = db.last_insert_row_id

# # Ferme la base de données
# db.close
end

