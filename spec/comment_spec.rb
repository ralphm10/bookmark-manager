require 'comment'
require 'database_helpers'

describe Comment do
  describe '.create' do
    it 'adds a new comment' do
      test_bookmark = Bookmark.create(url: 'https://www.linkedin.com/', title: 'LinkedIn')
      test_data = persisted_data(id: test_bookmark.id)
      test_comment = Comment.create(text: 'great bookmark', bookmark_id: test_bookmark.id, )
      expect(test_comment).to be_a Comment
      expect(test_comment.text).to eq 'great bookmark'
    end
  end
end
