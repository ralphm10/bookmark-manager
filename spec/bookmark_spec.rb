require 'bookmark'
require 'comment'
require 'database_helpers'

describe Bookmark do
  let(:fake_comments) { double(:comment) }
  let(:fake_tag) { double(:tag) }

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

  describe '.comments' do
    it 'calls .where on Comment class' do
      test_bookmark = Bookmark.create(url: 'https://www.linkedin.com/', title: 'LinkedIn')
      expect(fake_comments).to receive(:where).with(bookmark_id: test_bookmark.id)
      test_bookmark.comments(fake_comments)
    end
  end

  describe '.tags' do
    it 'calls .where on the tag class' do
      test_bookmark = Bookmark.create(url: 'https://www.nfl.com', title: 'NFL')
      expect(fake_tag).to receive(:where).with(bookmark_id: test_bookmark.id)
      test_bookmark.tags(fake_tag)
    end
  end

  describe '.where' do
    it ' returns bookmarks with a specific tag' do
      test_bookmark = Bookmark.create(url: 'https://www.nfl.com', title: 'NFL')
      tag1 = Tag.create(content: 'sport')
      tag2 = Tag.create(content: 'entertainment')
      BookmarkTag.create(bookmark_id: test_bookmark.id, tag_id: tag1.id)
      BookmarkTag.create(bookmark_id: test_bookmark.id, tag_id: tag2.id)

      tagged_bookmarks = Bookmark.where(tag_id: tag1.id)
      result = tagged_bookmarks.first

      expect(tagged_bookmarks.length).to eq 1
      expect(result).to be_a Bookmark
      expect(result.id).to eq test_bookmark.id
      expect(result.title).to eq test_bookmark.title
      expect(result.url).to eq test_bookmark.url
    end
  end
end

