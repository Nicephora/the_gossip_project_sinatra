require_relative 'gossip'  #on appelle le fichier gossip car on va utiliser sa classe
require 'pry'
class ApplicationController < Sinatra::Base  #En gros cest comme si on faisait hériter la classe d"une classe Sinatra, cest ce qui va faire fonctionner Sinatra
  get '/' do                                 # Cela dit à l'appli Sinatra "si quelqu'un va sur l'URL '/', exécute le code qui suit !"
    erb :index, locals: {gossips: Gossip.all}
  end
  get '/gossips/new/' do
    erb :new_gossip           #si quelqu'un va sur '/'gossip/new, affiche la view new_gossip"
  end
  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'               #Gossip.new(les_entrées_du_gossip) crée la nouvelle instance de Gossip. Et en lui appliquant un .save, on veut qu'elle soit inscrite dans la base de donnée
    puts "Ce programme ne fait rien pour le moment, on va donc afficher un message dans le terminal"
  end

  get '/gossips/:id' do
    erb :show, locals: {id: params['id'], gossip: Gossip.find(params['id'])}     #a valeur de :id sera alors accessible dans le hash sous params['id']. On peut ensuite le mettre en entrée de la méthode find du gossip pour trouver le gossip de cette id.
  end                                                                           #méthode pour avoir des URLs dynamiques
end
