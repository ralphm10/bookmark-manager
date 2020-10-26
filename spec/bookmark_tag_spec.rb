require 'bookmark_tag'
require 'tag'

describe BookmarkTag do
  describe '.create' do
    it 'creats a link between a bookmark and a tag' do
      test_bookmark = Bookmark.create(url: 'https://www.nfl.com', title: 'NFL')
      test_tag = Tag.create(content: 'sport')

      test_bookmark_tag = BookmarkTag.create(bookmark_id: test_bookmark.id, tag_id: test_tag.id)

      expect(test_bookmark_tag).to be_a BookmarkTag
      expect(test_bookmark_tag.tag_id).to eq test_tag.id
      expect(test_bookmark_tag.bookmark_id).to eq test_bookmark.id
    end
  end
end
