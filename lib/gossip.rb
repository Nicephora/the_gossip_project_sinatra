require 'csv'
require 'pry'

class Gossip
  attr_reader :author, :content
  def initialize(author, content)
    @content = content
    @author = author
  end


  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    all_gossips = Array.new

    CSV.read("./db/gossip.csv").each do |csv_line|
      gossip_provisoire = Gossip.new(csv_line[0], csv_line[1])
      all_gossips << gossip_provisoire
    end
    return all_gossips
  end
  def self.find(id)
    return self.all[id.to_i]
  end


end
