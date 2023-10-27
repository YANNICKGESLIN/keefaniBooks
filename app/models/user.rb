class User < ActiveRecord::Base

  attr_accessor :username, :password
  	validates :username, presence: true, uniqueness: true
  		  has_many :borrowings
  has_many :books, through: :borrowings


end

# Ferme la base de données
db.close
