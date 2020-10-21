feature 'deleting bookmarks' do
  scenario 'user can add delete a bookmark' do
    Bookmark.create(url: 'https://www.nfl.com/uk/', title: 'NFL UK')
    visit '/bookmarks'

    expect(page).to have_link('NFL UK', href: 'https://www.nfl.com/uk/')
    first('.bookmark').click_button('Delete')
    expect(current_path).to eq '/bookmarks'
    expect(page).to_not have_link('GitHub', href: 'http://github.com/')
  end
end
