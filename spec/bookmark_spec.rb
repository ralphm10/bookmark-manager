require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      bookmarks = Bookmark.all
      expect(bookmarks).to include('https://www.nfl.com/uk/')
      expect(bookmarks).to include('https://www.goal.com/en-gb')
    end
  end
end