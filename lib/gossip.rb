require 'csv'
require 'pry'

class Gossip
  attr_reader :author, :content                  #Bon la petite routine les attr et l'initialize tout ça tout ça
  def initialize(author, content)
    @content = content
    @author = author
  end


  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|   #la méthode save exporte l'auteur et le contenu du gossip dans le gossip.csv
      csv << [@author, @content]
    end
  end

  def self.all                                    #la méthode all va créer un nouvel array all_gossips dans lequel tous les gossips seront stockés
    all_gossips = Array.new
    CSV.read("./db/gossip.csv").each do |csv_line|
      gossip_provisoire = Gossip.new(csv_line[0], csv_line[1])    #on prends 2 éléments par 2 éléments les gossips CSV pour les stocké dans une variables
      all_gossips << gossip_provisoire                            # on met chaque élément 2 par 2 dans l'array
    end
    return all_gossips
  end
  def self.find(id)                                                #cette méthode permet de trouver l'id qui correspond à tel potin
    return self.all[id.to_i]                                      #on convertit en Integer l'id
  end


end
