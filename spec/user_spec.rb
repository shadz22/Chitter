require_relative './database_helpers'
require_relative './../lib/user'

describe User do

  describe '.create' do
    it 'creates a new user on sign up' do
      user = User.create(name: 'James Smith', email: 'test@testing.com', username: 'Jamsey', password: 'password123')
      persisted_data = persisted_data(table: 'users', id: user.id)

      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.name). to eq 'James Smith'
    end
  end
end
