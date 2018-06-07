feature 'controlling database bookmarks' do
  scenario 'adding a new bookmark to the database' do
    # connection = PG.connect(dbname: 'bookmark_manager_test')
    # connection.exec("INSERT INTO bookmarks (url) VALUES('http://instagram.com');")

    visit('/bookmarks/new')
    fill_in('url', with: 'http://instagram.com')
    click_button 'Submit'
    expect(page).to have_content 'http://instagram.com'
  end
end
