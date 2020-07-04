require_relative './../lib/peep'
require 'pg'

describe Peep do

  describe '.all' do
    it 'returns all the peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (peep) VALUES ('My first peep');")
      connection.exec("INSERT INTO peeps (peep) VALUES ('This is the second one');")

      peeps = Peep.all
      
      expect(peeps).to include('My first peep')
      expect(peeps).to include('This is the second one')
    end
  end
end