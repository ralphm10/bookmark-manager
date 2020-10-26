feature 'user registration' do
  scenario 'new user can sign up' do
    visit '/bookmarks'
    click_link('Sign up')
    fill_in('email', with: 'ralph.mallett@example.com')
    fill_in('password', with: 'passw0rd')
    click_button('Submit')
    expect(page).to have_content('Welcome, Ralph')
  end
end