feature 'creating bookmarks' do
  scenario 'user can add a new bookmark' do
    visit '/bookmarks'
    click_link('Add bookmark')
    fill_in('url', with: 'http://github.com/')
    fill_in('title', with: 'GitHub')
    click_button('Submit')
    expect(page).to have_link('GitHub', href: 'http://github.com/')
  end
  scenario 'the url must be valid' do
    visit '/bookmarks/new'
    fill_in('url', with: 'football')
    click_button('Submit')
    expect(page).to have_content 'Please enter correct url'
  end
end
