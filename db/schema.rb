# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 0) do
  create_table "Books", force: :cascade do |t|
    t.text "titre"
    t.text "auteur"
    t.text "genre"
    t.integer "annee_publication"
    t.integer "exemplaires_disponibles"
  end

  create_table "Emprunts", force: :cascade do |t|
    t.integer "membre_id"
    t.integer "book_id"
    t.date "date_emprunt"
    t.date "date_retour_prevue"
  end

  create_table "HistoriqueEmprunts", force: :cascade do |t|
    t.integer "membre_id"
    t.integer "book_id"
    t.date "date_emprunt"
    t.date "date_retour"
  end

  create_table "Membres", force: :cascade do |t|
    t.text "nom"
    t.text "adresse_email"
    t.text "mot_de_passe"
    t.date "date_inscription"
  end

  create_table "Retours", force: :cascade do |t|
    t.integer "emprunt_id"
    t.date "date_retour_effectif"
    t.integer "penalite_retard"
  end

  add_foreign_key "Emprunts", "Books", column: "book_id"
  add_foreign_key "Emprunts", "Membres", column: "membre_id"
  add_foreign_key "HistoriqueEmprunts", "Books", column: "book_id"
  add_foreign_key "HistoriqueEmprunts", "Membres", column: "membre_id"
  add_foreign_key "Retours", "Emprunts", column: "emprunt_id"
end
