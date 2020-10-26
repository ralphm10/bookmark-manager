require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec('TRUNCATE TABLE bookmarks, comments, bookmark_tags, users;')
end
