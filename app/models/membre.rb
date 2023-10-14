# Importe les bibliothèques nécessaires
require 'sqlite3'
require 'yaml'

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

# Crée un utilisateur
membre = {
  nom: 'Nom du membre',
  email: 'email@example.com',
  password: 'password'
}
membre = Membre.create(nom: 'Nom du Membre', email: 'email@example.com', password: 'motdepasse')


# Insère l'utilisateur dans la base de données
db.execute('INSERT INTO Membres (nom, email, password) VALUES (?, ?, ?)', [membre[:nom], membre[:email], membre[:password]])
membre_id = db.last_insert_row_id
