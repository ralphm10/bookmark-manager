require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'connects to a databse' do
      connection = DatabaseConnection.setup('bookmark_manager_test')
      expect(connection.port).to eq 5432
    end
  end
end