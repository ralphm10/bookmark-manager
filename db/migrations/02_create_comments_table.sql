CREATE TABLE comments (
id SERIAL PRIMARY KEY,
test VARCHAR(240),
bookmark_id INTEGER REFERENCES bookmarks (id)
);