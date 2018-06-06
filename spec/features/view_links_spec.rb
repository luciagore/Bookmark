require 'bookmark'

feature 'link viewing' do
  scenario 'I can view links' do
    # Add the test data
    Bookmark.create(url: 'http://twitter.com')
    Bookmark.create(url: 'http://destroyallsoftware.com')
    Bookmark.create(url: 'http://google.com')

    visit '/bookmarks'
    # expect(page).to have_xpath("//a")
    expect(page).to have_content 'http://google.com'
  end
end
