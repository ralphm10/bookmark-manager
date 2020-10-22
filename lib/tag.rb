require_relative 'database_connection'

class Tag
  def self.create(content:)
    result = DatabaseConnection.query("INSERT INTO tags (content) VALUES('#{content}') RETURNING id, content;")
    Tag.new(id: result[0]['id'], content: result[0]['content'])
  end

  def self.where(bookmark_id:)
    result = DatabaseConnection.query("SELECT id, content FROM bookmark_tags INNER JOIN tags ON tags.id = bookmark_tags.tag_id WHERE bookmark_tags.bookmark_id = '#{bookmark_id}';")

  attr_reader :content

  def initialize(content)
    @content = content
  end 
end 