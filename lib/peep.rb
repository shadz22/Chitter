require 'pg'
require_relative './database_connection'

class Peep

  attr_reader :id, :text
  
  def initialize(id:, text:)
    @id = id
    @text = text
  end

  def self.all
    result = DatabaseConnection.query(("SELECT * FROM peeps"))
    result.map { |peep|  peep['peep'] }
  end

  def self.create(message:)
    result = DatabaseConnection.query("INSERT INTO peeps (peep) VALUES ('#{message}') RETURNING id, peep;")
    Peep.new(id: result[0]['id'], text: result[0]['peep'])
  end

end
