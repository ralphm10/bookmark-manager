feature 'sign out' do
  scenario 'user signs out and gets confirmation message' do
    User.create(email: 'ralph.mallett@example.com', password: 'passw0rd')
    visit '/bookmarks'
    click_link('Sign in')
    fill_in('email', with: 'ralph.mallett@example.com')
    fill_in('password', with: 'passw0rd')
    click_button('Submit')
    click_link('Sign out')
    expect(page).to have_content 'You have been signed out'
  end
end