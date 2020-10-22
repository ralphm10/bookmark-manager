feature 'adding and viewing tags' do
  feature 'user can add then view a tag' do
    scenario 'comment is added to bookmark' do
      test_bookmark = Bookmark.create(url: 'https://www.nfl.com', title: 'NFL')

      visit '/bookmarks'
      first('.bookmark').click_button 'Add tag'

      expect(current_path).to eq "/bookmarks/#{test_bookmark.id}/tags/new"

      fill_in 'tag', with: 'sport'
      expect(first('.bookmark')).to have_content 'sport'
    end
  end
end