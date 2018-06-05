feature 'link viewing' do
  scenario 'I can view links' do
    visit ('/bookmarks')
    #expect(page).to have_xpath("//a")
    expect(page).to have_content "http://askjeeves.com"
  end
end
