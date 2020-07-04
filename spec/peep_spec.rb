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

  describe '.create' do
    it 'creates new peeps' do
      Peep.create(message: "Test creating a peep")

      expect(Peep.all).to include("Test creating a peep")
    end
  end

end