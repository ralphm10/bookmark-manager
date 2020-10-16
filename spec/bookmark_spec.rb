require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks (url) VALUES('https://www.nfl.com/uk/');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('https://www.goal.com/en-gb');")

      bookmarks = Bookmark.all.map { |bookmark| bookmark['url'] }

      expect(bookmarks).to include('https://www.nfl.com/uk/')
      expect(bookmarks).to include('https://www.goal.com/en-gb')
    end
  end

  describe '.create' do
    it 'adds a new bookmark do' do
      bookmark = Bookmark.create(url: 'https://www.linkedin.com/', title: 'LinkedIn').first
      expect(bookmark['url']).to eq('https://www.linkedin.com/')
      expect(bookmark['title']).to eq('LinkedIn')
    end
  end
end
