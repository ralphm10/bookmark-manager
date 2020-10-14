require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      bookmarks = Bookmark.all
      expect(bookmarks).to include('https://www.mixcloud.com/')
      expect(bookmarks).to include('https://soundcloud.com/')
    end
  end
end