require_relative './../lib/peep'
require 'pg'

describe Peep do
  describe '.all' do
    it 'returns all the peeps' do
      peeps = Peep.all
      expect(peeps).to include('My first peep')
      expect(peeps).to include('This is the second one')
    end
  end
end