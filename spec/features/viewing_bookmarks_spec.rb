feature 'viewing bookmarks' do
  scenario 'bookmarks page shows all bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content 'https://www.goal.com/en-gb'
    expect(page).to have_content 'https://www.nfl.com/uk/'
  end
end