feature 'viewing bookmarks' do
  scenario 'bookmarks page shows all bookmarks' do

    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (url) VALUES('https://www.nfl.com/uk/');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('https://www.goal.com/en-gb');")

    visit '/bookmarks'

    expect(page).to have_content 'https://www.goal.com/en-gb'
    expect(page).to have_content 'https://www.nfl.com/uk/'
  end
end