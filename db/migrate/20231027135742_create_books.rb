class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.integer :id
      t.string :auteur
      t.string :genre
      t.integer :annee_publication
      t.integer :exemplaires_disponibles
      t.integer :isbn
      t.integer :image

      t.timestamps
    end
  end
end
