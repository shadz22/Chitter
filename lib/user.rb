require_relative './database_connection'

class User

  attr_reader :id, :name, :username

  def initialize(id:, name:, username:)
    @id = id
    @name = name
    @username = username
  end

  def self.create(name:, email:, username:, password:)
    result = DatabaseConnection.query("INSERT INTO users (name, email, username, password) VALUES ('#{name}', '#{email}', '#{username}', '#{password}') RETURNING id, name, username;")
    User.new(id: result[0]['id'], name: result[0]['name'], username: result[0]['username'])
  end

end
