require 'user'
require 'database_helpers'
require 'bcrypt'

describe User do
  describe '.create' do
    it 'adds a new user' do
      test_user = User.create(email: 'ralph.mallett@example.com', password: 'passw0rd')
      test_data = persisted_data(table: :users, id: test_user.id)

      expect(test_user).to be_a User
      expect(test_user.id).to eq test_data.first['id']
      expect(test_user.email).to eq('ralph.mallett@example.com')
    end
  end
  describe '.find' do
    it 'finds user by id' do
      test_user = User.create(email: 'ralph.mallett@example.com', password: 'passw0rd')
      result = User.find(id: test_user.id)
      expect(result.email).to eq test_user.email
    end
    it 'return nil if there is no ID' do
      expect(User.find(id: nil)).to eq nil
    end
  end
end
