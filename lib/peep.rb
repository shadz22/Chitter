require 'pg'
require_relative './database_connection'

class Peep

  attr_reader :id, :text, :timestamp
  
  def initialize(id:, text:, timestamp:)
    @id = id
    @text = text
    @timestamp = timestamp
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY id DESC")
    result.map { |peep|  
      Peep.new(id: peep['id'], text: peep['peep'], timestamp: peep['peep_time']) 
    }
  end

  def self.create(message:, timestamp: Time.now.strftime("%Y-%m-%d %H:%M"))
    result = DatabaseConnection.query("INSERT INTO peeps (peep, peep_time) VALUES ('#{message}', '#{timestamp}') RETURNING id, peep, peep_time;")
    Peep.new(id: result[0]['id'], text: result[0]['peep'], timestamp: result[0]['peep_time'])
  end

end
