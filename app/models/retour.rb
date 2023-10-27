# Importe les bibliothèques nécessaires
require 'sqlite3'
require 'date'

class Retour < ApplicationRecord
  # Définition des attributs du modèle
  validates :emprunt_id, presence: true
  validates :date_retour, presence: true
end

# Ouvre la base de données
db = SQLite3::Database.new('biblio.sqlite3')

emprunt = Emprunt.find_by(membre_id: membre_id, book_id: book_id)
emprunt_id = emprunt.id if emprunt


# Crée un retour en associant l'ID de l'emprunt
retour = {
  emprunt_id: emprunt_id,
  date_retour: Date.today
}

# Utilise une requête préparée pour insérer le retour dans la table
db.execute('INSERT INTO Retours (emprunt_id, date_retour) VALUES (?, ?)', [retour[:emprunt_id], retour[:date_retour]])

# Ferme la base de données
db.close
