class DirectoryEntry < ActiveRecord::Base
  after_save :load_into_soulmate

  attr_accessible :address, :name, :phone
  def self.user_index(term)
    matches = Soulmate::Matcher.new('directoryentry').matches_for_term(term)
    matches.collect {|match| {"id" => match["id"], "label" => match["term"], "value" => match["term"] } }
    matches.map { |match| self.find(match['id'].to_i) }
  end

  def load_into_soulmate
    loader = Soulmate::Loader.new('directoryentry')
    loader.add('term'=>name, 'id'=> id)
  end

  def self.search(term)
    matches = Soulmate::Matcher.new('directoryentry').matches_for_term(term)
    matches.collect {|match| {"id" => match["id"], "label" => match["term"], "value" => match["term"] } }
  end

end
