# Importe les bibliothèques nécessaires
require 'sqlite3'
require 'yaml'

class Book < ApplicationRecord
  # Définition des attributs du modèle
  validates :titre, presence: true
  validates :auteur, presence: true
  validates :genre, presence: true
  validates :annee_publication, numericality: true
  validates :exemplaires_disponibles, numericality: true
  validates :isbn, presence: true

  # Définition des relations du modèle
   belongs_to :book
  belongs_to :membre
  has_many :emprunts
end

 def to_s
    "#{titre} par #{auteur}"
  end


# Ouvre la base de données
db = SQLite3::Database.new('biblio.sqlite3')



# Crée un livre
book = {
  titre: 'Une si longue lettre',
  auteur: 'Mariama bâ',
  genre: 'Roman',
  annee_publication:'2000',
  exemplaires_disponibles:'7',
  isbn: '978-2070363286'
}

# Insère le livre dans la base de données
db.execute('INSERT INTO books (titre, auteur, genre, isbn) VALUES (?, ?, ?, ?)', [book[:titre], book[:auteur], book[:genre], book[:isbn]])
book_id = db.last_insert_row_id



# Ferme la base de données
db.close