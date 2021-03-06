feature 'user sign in' do
  scenario 'existing user can sign in' do
    User.create(email: 'ralph.mallett@example.com', password: 'passw0rd')
    visit '/bookmarks'
    click_link('Sign in')
    fill_in('email', with: 'ralph.mallett@example.com')
    fill_in('password', with: 'passw0rd')
    click_button('Submit')
    expect(page).to have_content 'Welcome, ralph.mallett@example.com'
  end
end