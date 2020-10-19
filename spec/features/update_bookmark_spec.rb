feature 'updating bookmarks' do
  scenario 'user can update a bookmark' do
    bookmark = Bookmark.create(url: 'http://www.atlantafalcons.com', title: 'Falcons')
    visit('/bookmarks')
    expect(page).to have_link('Falcons', href:'http://www.atlantafalcons.com')
    
    first('.bookmark').click_button 'Edit'
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"

    fill_in('url', with: 'https://www.miamidolphins.com/')
    fill_in('title', with: 'Dolphins')
    click_button('Submit')
    
    expect(current_path).to eq '/bookmarks'
    expect(page).to have_link('Dolphins', href:'https://www.miamidolphins.com/')
    expect(page).not_to have_link('Falcons', href:'http://www.atlantafalcons.com')
  end
end