require 'pg'

task :setup do
  p "Creating databases..."

  connection = PG.connect
  connection.exec("CREATE DATABASE bookmark_manager;")
  connection.exec("CREATE DATABASE bookmark_manager_test;")

  connection = PG.connect(dbname: 'bookmark_manager')
  connection.exec("CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60), title varchar(60));")
  connection.exec("CREATE TABLE comments (id SERIAL PRIMARY KEY, text VARCHAR(240),bookmark_id INTEGER REFERENCES bookmarks (id));")
  connection.exec("CREATE TABLE tags (id SERIAL PRIMARY KEY, content VARCHAR(60));")
  connection.exec("CREATE TABLE bookmark_tags(tag_id INTEGER REFERENCES tags (id), bookmark_id INTEGER REFERENCES bookmarks (id));")
  connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, email VARCHAR(60), password varchar(140));")

  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60), title varchar(60));")
  connection.exec("CREATE TABLE comments (id SERIAL PRIMARY KEY, text VARCHAR(240),bookmark_id INTEGER REFERENCES bookmarks (id));")
  connection.exec("CREATE TABLE tags (id SERIAL PRIMARY KEY, content VARCHAR(60));")
  connection.exec("CREATE TABLE bookmark_tags(tag_id INTEGER REFERENCES tags (id), bookmark_id INTEGER REFERENCES bookmarks (id));")
  connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, email VARCHAR(60), password varchar(140));")
end
