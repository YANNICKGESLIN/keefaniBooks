# Importe les bibliothèques nécessaires
require 'sqlite3'
require 'yaml'
require 'date'


class Retour < ApplicationRecord
  # Définition des attributs du modèle
  validates :emprunt_id, presence: true
  validates :date_retour, presence: true
end
# Récupérer l'ID de l'emprunt
emprunt_id = emprunt.id

# Insérer le retour en associant l'ID de l'emprunt
retour = {
  emprunt_id: emprunt_id,
  date_retour: Date.today
}

# Insérer le retour dans la base de données
db.execute('INSERT INTO Retours (emprunt_id, date_retour) VALUES (?, ?)', [retour[:emprunt_id], retour[:date_retour]])


