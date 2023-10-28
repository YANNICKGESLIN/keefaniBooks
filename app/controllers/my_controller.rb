class MyController < ApplicationController
  @@db_mutex = Mutex.new

  def some_action
    # Utilisation du Mutex pour sécuriser l'accès à la base de données
    @@db_mutex.synchronize do
      # Effectuez ici des opérations sur la base de données
    end
  end
end
