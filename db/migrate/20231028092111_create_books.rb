class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :titre
      t.string :auteur
      t.string :genre
      t.integer :annee_publication
      t.integer :exemplaires_disponibles
      t.integer :isbn
      t.string :image # Si vous stockez le chemin de l'image
      t.timestamps
    end
  end
end
