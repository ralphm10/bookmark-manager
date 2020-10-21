require 'comment'
require 'database_helpers'
require 'bookmark'

describe Comment do
  describe '.create' do
    it 'adds a new comment' do
      test_bookmark = Bookmark.create(url: 'https://www.linkedin.com/', title: 'LinkedIn')
      test_comment = Comment.create(text: 'great bookmark', bookmark_id: test_bookmark.id)

      persisted_data = persisted_data(table: 'comments', id: test_comment.id)

      expect(test_comment).to be_a Comment
      expect(test_comment.id).to eq persisted_data.first['id']
      expect(test_comment.text).to eq 'great bookmark'
      expect(test_comment.bookmark_id).to eq test_bookmark.id
    end
  end
end
