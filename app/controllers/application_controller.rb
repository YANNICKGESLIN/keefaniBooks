class ApplicationController < ActionController::Base
  def index
    # Interface utilisateur
loop do
  puts "Que souhaitez-vous faire?"
  puts "1. Lister les livres"
  puts "2. Créer un livre"
  puts "3. Supprimer un livre"
  puts "4. Modifier un livre"
  puts "5. Quitter"
  choix = gets.chomp.to_i

  case choix
  when 1
    lister_livres(db)
  when 2
    puts "Entrez le titre du livre:"
    titre = gets.chomp
    puts "Entrez l'auteur du livre:"
    auteur = gets.chomp
    puts "Entrez l'année du livre:"
    annee_publication = gets.chomp.to_i
    creer_livre(db, titre, auteur, annee_publication)
  when 3
    puts "Entrez l'ID du livre à supprimer:"
    id = gets.chomp.to_i
    supprimer_livre(db, id)
  when 4
    puts "Entrez l'ID du livre à modifier:"
    id = gets.chomp.to_i
    puts "Entrez le nouveau titre du livre:"
    titre = gets.chomp
    puts "Entrez le nouvel auteur du livre:"
    auteur = gets.chomp
    puts "Entrez la nouvelle année du livre:"
    annee_publication = gets.chomp.to_i
    modifier_livre(db, id, titre, auteur, annee_publication)
  when 5
    break
  else
    puts "Choix invalide. Veuillez réessayer."
  end
end

# Fermeture de la base de données
db.close
  end
end
