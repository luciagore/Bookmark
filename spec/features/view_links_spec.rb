require 'bookmark'

feature 'link viewing' do
  scenario 'I can view links' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    # Add the test data
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://twitter.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://google.com');")

    visit '/bookmarks'
    # expect(page).to have_xpath("//a")
    expect(page).to have_content 'http://google.com'
  end
end
