feature 'user sign in with incorrect credendtials' do
  scenario 'error message displayed if incorrect email provided' do
    User.create(email: 'ralph.mallett@example.com', password: 'passw0rd')
    visit '/bookmarks'
    click_link('Sign in')
    fill_in('email', with: 'ralph.mallet@example.com')
    fill_in('password', with: 'passw0rd')
    click_button('Submit')
    expect(page).to have_content('Please check email or password')
  end
end
