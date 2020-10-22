## Bookmark Manager

A simple website to save my bookmarks.

### To setup database
1. Connect to psql
2. Create the database using the psql command CREATE DATABASE bookmark_manager;
3. Connect to the database using the pqsl command \c bookmark_manager;
4. Run the query we have saved in the file 01_create_bookmarks_table.sql

### To setup test database
1. Connect to psql
2. Create the database using the psql command CREATE DATABASE bookmark_manager_test;
3. Connect to the database using the pqsl command \c bookmark_manager_test;
4. Run the query we have saved in the file 01_create_bookmarks_table.sql

### User Stories

```
As a busy developer
So that I can quickly access my favourite websites
I would like to see a list of bookmarks

As a busy developer
So that my bookmarks are up to date
I would like to be able to add a new bookmark

As a busy developer
So that I can save a website
I would like bookmarks to display the name and title

As a busy developer
If I no longer wish to visit a website
I would like to be able to delete a bookmark

As a busy developer
So that I know my bookmarks are up to date
I would like to be able to amend the title or link of a bookmark

As a busy developer
So that I know why I added it
I would like to be able to add a comment to a bookmark

As a dubsy developer
So that I can add my bookmarks to categories
I would like to be able to tag a bookmark
```
