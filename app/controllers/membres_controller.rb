class MembresController < ApplicationController
  def show

MessageMailer.send_message('destinataire@example.com', 'Contenu du message').deliver_now
  end
  def index

  end
  def new

  end
  def update

  end
end
