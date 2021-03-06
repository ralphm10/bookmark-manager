feature 'creating comments' do
  scenario 'user can comment on a bookmark' do
    bookmark = Bookmark.create(url: 'https://www.goal.com/en-gb', title: 'Goal!')
    visit '/bookmarks'
    first('.bookmark').click_button 'Add comment'
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/comments/new"

    fill_in('comment', with: 'my favourite football site')
    click_button('Submit')
    expect(first('.bookmark')).to have_content('my favourite football site')
  end
end
