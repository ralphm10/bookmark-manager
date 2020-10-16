require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks (url) VALUES('https://www.nfl.com/uk/');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('https://www.goal.com/en-gb');")

      bookmarks = Bookmark.all

      expect(bookmarks).to include('https://www.nfl.com/uk/')
      expect(bookmarks).to include('https://www.goal.com/en-gb')
    end
  end

  describe '.create' do
    it 'adds a new bookmark do' do
      Bookmark.create(url: 'https://www.linkedin.com/', title: 'LinkedIn')
      expect(Bookmark.all).to include('https://www.linkedin.com/')
    end
  end
end
