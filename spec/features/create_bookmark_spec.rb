feature 'creating bookmarks' do
  scenario 'user can add a new bookmark' do
    visit '/bookmarks'
    click_link('Add bookmark')
    fill_in('url', with: 'http://github.com/')
    fill_in('title', with: 'GitHub')
    click_button('Submit')
    expect(page).to have_content('http://github.com/')
  end
end