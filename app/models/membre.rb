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

# Crée un membre
membre = {
  nom: 'Nom du membre',
  email: 'email@example.com',
  password: 'motdepasse'
}

# Utilise une requête préparée pour insérer le membre dans la table
db.execute('INSERT INTO membres (nom, email, password) VALUES (?, ?, ?)', [membre[:nom], membre[:email], membre[:password]])

# Récupère l'ID du membre créé
membre_id = db.last_insert_row_id

# Ferme la base de données
db.close
