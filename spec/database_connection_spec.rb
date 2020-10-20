require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'connects to a databse' do
      connection = DatabaseConnection.setup('bookmark_manager_test')
      expect(connection.port).to eq 5432
    end
    it 'is a persistent connection' do
      connection = DatabaseConnection.setup('bookmark_manager_test')
      expect(DatabaseConnection.connection).to eq connection
    end
  end

  describe './query' do
    it 'makes an SQL query on a database' do
      connection = DatabaseConnection.setup('bookmark_manager_test')
      first_bookmark = Bookmark.create(url: 'https://www.hotels.com/', title: 'Hotels')
      query = DatabaseConnection.query("SELECT * FROM bookmarks WHERE title = 'Hotels'")
      expect(query.first['url']).to eq 'https://www.hotels.com/'
    end
  end
end