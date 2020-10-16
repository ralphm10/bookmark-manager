require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      first_bookmark = Bookmark.create(url: 'https://www.hotels.com/', title: 'Hotels')
      Bookmark.create(url: 'https://www.liverpoolfc.com/', title: 'Liverpool FC')
      Bookmark.create(url: 'https://www.beer52.com/', title: 'Beer 52')

      bookmarks = Bookmark.all
      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq first_bookmark.id
      expect(bookmarks.first.title).to eq 'Hotels'
      expect(bookmarks.first.url).to eq 'https://www.hotels.com/'
    end
  end

  describe '.create' do
    it 'adds a new bookmark' do
      test_bookmark = Bookmark.create(url: 'https://www.linkedin.com/', title: 'LinkedIn')
      test_data = PG.connect(dbname: 'bookmark_manager_test').query("SELECT * FROM bookmarks WHERE id = #{test_bookmark.id};")

      expect(test_bookmark).to be_a Bookmark
      expect(test_bookmark.id).to eq test_data[0]['id']
      expect(test_bookmark.url).to eq('https://www.linkedin.com/')
      expect(test_bookmark.title).to eq('LinkedIn')
    end
  end
end
