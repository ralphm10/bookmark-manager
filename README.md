# Bookmark Manager

A simple web app to save my bookmarks.

This was completed as part of the Makers course and was my first full stack web application, providing experience of using the MVC model, relational databases, ORM, and RESTful routes.

The user stores for the application are listed [here](#user-stories).

I made reference to this [repo](https://github.com/makersacademy/bookmark_manager_example) when working on the project. 

## Getting started
```
> git clone https://github.com/ralphm10/bookmark-manager
> bundle
```
Run database migrations below; 

### To setup databases
1. Connect to `psql`
2. Create the database using the psql command `CREATE DATABASE bookmark_manager`;
3. Create the database using the psql command `CREATE DATABASE bookmark_manager_test;`
3. Connect to the relavent database using the pqsl command `\c bookmark_manager;` or `\c bookmark_manager_test;`
4. Run the queries saved in `db/migrations` in the given order

### To run locally
```
> rackup
```
Go to <code>localhost:9292</code>

## Running tests
```
> rspec
```

### [User Stories](#user-stories)

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

As a busy developer
So that I can add my bookmarks to categories
I would like to be able to tag a bookmark

As a busy developer
So that I can easy find bookmarks
I would like to be able to filter bookmarks on their tags

As a busy developer
So that I can can  maintain my own bookmark list
I want to sign up with my email address

As a busy developer
So that I can keep my account secure
I want to sign in with my email and password
```
