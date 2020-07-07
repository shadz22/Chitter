require_relative './../lib/peep'
require_relative './database_helpers'
require 'pg'

describe Peep do

  describe '.all' do
    it 'returns all the peeps' do

      peep = Peep.create(message: 'My first peep')
      Peep.create(message: 'This is the second one')
    
      peeps = Peep.all

      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.text).to eq peep.text
    end
  end

  describe '.create' do
    it 'creates new peeps' do
      peep = Peep.create(message: "Test creating a peep")
      persisted_data = persisted_data(table: 'peeps', id: peep.id)

      expect(peep.text).to eq "Test creating a peep"
      expect(peep.id).to eq persisted_data.first['id']
    end
  end

end