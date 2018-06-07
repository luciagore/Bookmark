feature 'deleting a bookmark' do
  scenario 'a user can delete a bookmark' do
    bookmark = Bookmark.create(url: 'http://theguardian.com')
    visit('/bookmarks')

    within "#bookmark-#{bookmark.id}" do
      click_button 'Delete'
    end

    # expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_content 'http://theguardian.com'
  end
end
