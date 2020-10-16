feature 'viewing bookmarks' do
  scenario 'bookmarks page shows all bookmarks' do
    Bookmark.create(url: 'https://www.nfl.com/uk/', title: 'NFL UK')
    Bookmark.create(url: 'https://www.goal.com/en-gb', title: 'Goal!')

    visit '/bookmarks'

    expect(page).to have_content 'https://www.goal.com/en-gb'
    expect(page).to have_content 'https://www.nfl.com/uk/'
  end
end
