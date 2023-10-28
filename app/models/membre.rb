# Importe les bibliothèques nécessaires
require 'sqlite3'

class Membre < ApplicationRecord
  # Définition des attributs du modèle
  validates :nom, presence: true
  validates :email, presence: true
  validates :password, presence: true

  # Définition des relations du modèle (si nécessaire)
  has_many :emprunts
end

# Ouvre la base de données
db = SQLite3::Database.new('biblio.sqlite3')

membre= {
  nom: 'Nom du Membre',
  email: 'membre@example.com',
  password: 'mot_de_passe'
}

#db.transaction do
  # Insère le nouveau membre
  #db.execute('INSERT INTO membres (nom, email, password, date_inscription) VALUES (?, ?, ?,?)', [membre[:nom], membre[:email], membre[:password], membre[:date_inscription]])

  # Récupère l'ID du membre créé
 # membre_id = db.last_insert_row_id

  # Termine la transaction en validant les modifications
  #db.commit

# Ferme la base de données
#db.close

