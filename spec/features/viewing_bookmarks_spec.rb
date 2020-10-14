feature 'viewing bookmarks' do
  scenario 'bookmarks page shows all bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content 'https://www.mixcloud.com/'
    expect(page).to have_content 'https://soundcloud.com/'
  end
end 