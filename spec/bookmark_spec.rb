require 'bookmark'
require 'database_helpers'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      PG.connect(dbname: 'bookmark_manager_test')
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
      test_data = persisted_data(id: test_bookmark.id)

      expect(test_bookmark).to be_a Bookmark
      expect(test_bookmark.id).to eq test_data['id']
      expect(test_bookmark.url).to eq('https://www.linkedin.com/')
      expect(test_bookmark.title).to eq('LinkedIn')
    end
  end

  describe '.delete' do
    it 'deletes a bookmark' do
      test_bookmark = Bookmark.create(url: 'https://www.linkedin.com/', title: 'LinkedIn')
      Bookmark.delete(id: test_bookmark.id)
      expect(Bookmark.all.empty?).to eq true
    end
  end

  describe '.update' do
    it 'updates a bookmark' do
      test_bookmark = Bookmark.create(url: 'https://www.nfl.com', title: 'NFL')
      updated_bookmark = Bookmark.update(id: test_bookmark.id, url: 'https://www.nfl.com/uk', title: 'NFL UK')
      expect(updated_bookmark.url). to eq('https://www.nfl.com/uk')
      expect(updated_bookmark.title). to eq('NFL UK')
    end
  end
end
