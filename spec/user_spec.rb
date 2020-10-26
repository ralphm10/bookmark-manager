require 'user'
require 'database_helpers'
require 'bcrypt'

describe User do
  describe '.create' do
    it 'adds a new user' do
      test_user = User.create(email: 'ralph.mallett@example.com', password: 'passw0rd')
      test_data = persisted_data(table: 'users', id: test_user.id)

      expect(test_user).to be_a User
      expect(test_user.id).to eq test_data.first['id']
      expect(test_user.email).to eq('ralph.mallett@example.com')
      encrypted_password = BCrypt::Password.create('passw0rd')
      expect(encrypted_password).to eq 'passw0rd'
    end
  end
end
