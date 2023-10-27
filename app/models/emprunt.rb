# Importe les bibliothèques nécessaires
require 'sqlite3'
require 'date'

class Emprunt < ApplicationRecord
  # Définition des attributs du modèle
  validates :date_emprunt, presence: true
  validates :date_retour_prevue, presence: true

  # Définition des relations du modèle
  belongs_to :book
  belongs_to :membre
  has_one :retour
end

# Ouvrir la base de données
db = SQLite3::Database.new('biblio.sqlite3')

# Supposons que nous avons déjà obtenu le book_id et membre_id auparavant
book_id = 1  # Remplaçons 1 par l'ID réel du livre
membre_id = 1  # Remplaçons 1 par l'ID réel du membre

# Emprunte le livre
emprunt = {
  book_id: book_id,
  membre_id: membre_id,
  date_emprunt: Date.today,
  date_retour_prevue: Date.today + 7
}

# Insère l'emprunt dans la base de données
db.execute('INSERT INTO emprunts (book_id, membre_id, date_emprunt, date_retour_prevue) VALUES (?, ?, ?, ?)',
           [emprunt[:book_id], emprunt[:membre_id], emprunt[:date_emprunt], emprunt[:date_retour_prevue]])

# Ferme la base de données
db.close
