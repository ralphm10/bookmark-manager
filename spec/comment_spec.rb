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
  describe '.where' do
    it 'selects a comments based on bookmark id' do
      test_bookmark = Bookmark.create(url: 'https://www.linkedin.com/', title: 'LinkedIn')
      Comment.create(text: 'For jobhunting', bookmark_id: test_bookmark.id)
      Comment.create(text: 'And networking', bookmark_id: test_bookmark.id)

      all_comments = Comment.where(bookmark_id: test_bookmark.id)
      first_comment = all_comments.first
      persisted_data = persisted_data(table: 'comments', id: first_comment.id)

      expect(all_comments.length).to eq 2
      expect(first_comment.id).to eq persisted_data.first['id']
      expect(first_comment.text).to eq 'For jobhunting'
      expect(first_comment.bookmark_id).to eq test_bookmark.id
    end
  end
end
