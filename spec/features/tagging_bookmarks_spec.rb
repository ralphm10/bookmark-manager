feature 'adding and viewing tags' do
  feature 'user can add then view a tag' do
    scenario 'comment is added to bookmark' do
      test_bookmark = Bookmark.create(url: 'https://www.nfl.com', title: 'NFL')

      visit '/bookmarks'
      first('.bookmark').click_button 'Add tag'

      expect(current_path).to eq "/bookmarks/#{test_bookmark.id}/tags/new"

      fill_in 'tag', with: 'sport'
      click_button 'Submit'
      expect(first('.bookmark')).to have_content 'sport'
    end
  end

  feature 'a user can filter bookmarks by tag' do
    scenario 'adding the same tag to multiple bookmarks then filtering by tag' do
      Bookmark.create(url: 'http://www.nfl.com', title: 'NFL')
      Bookmark.create(url: 'http://www.liverpoolfc.com', title: 'LFC')
      Bookmark.create(url: 'http://www.google.com', title: 'Google')

      visit('/bookmarks')

      within page.find('.bookmark:nth-of-type(1)') do
        click_button 'Add tag'
      end
      fill_in 'tag', with: 'sport'
      click_button 'Submit'

      within page.find('.bookmark:nth-of-type(2)') do
        click_button 'Add tag'
      end
      fill_in 'tag', with: 'sport'
      click_button 'Submit'

      first('.bookmark').click_link 'sport'

      expect(page).to have_link 'NFL', href: 'http://www.nfl.com'
      expect(page).to have_link 'LFC',  href: 'http://www.liverpoolfc.com'
      expect(page).not_to have_link 'Google', href: 'http://www.google.com'
    end
  end
end
