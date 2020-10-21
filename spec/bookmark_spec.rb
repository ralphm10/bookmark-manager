require 'bookmark'
require 'comment'
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
      test_data = persisted_data(table: 'bookmarks', id: test_bookmark.id)

      expect(test_bookmark).to be_a Bookmark
      expect(test_bookmark.id).to eq test_data.first['id']
      expect(test_bookmark.url).to eq('https://www.linkedin.com/')
      expect(test_bookmark.title).to eq('LinkedIn')
    end
    it 'does not add an invalid url' do
      Bookmark.create(url: 'some url', title: 'some title')
      expect(Bookmark.all).to be_empty
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

  describe '.find' do
    it 'selects a bookmark from the database' do
      test_bookmark = Bookmark.create(url: 'https://www.nfl.com', title: 'NFL')
      result = Bookmark.find(id: test_bookmark.id)
      expect(result.title).to eq 'NFL'
    end
  end

  let(:fake_comments) { double(:comment) }

  describe '.comments' do
    it 'calls .where on Comment class' do
      test_bookmark = Bookmark.create(url: 'https://www.linkedin.com/', title: 'LinkedIn')
      expect(fake_comments).to receive(:where).with(bookmark_id: test_bookmark.id)

      test_bookmark.comments(fake_comments)
    end
  end
end
