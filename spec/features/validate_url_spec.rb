feature 'validates the URL' do
  scenario 'URL is not valid' do
    visit('/bookmarks/new')
    fill_in('url', with: 'www.theinvalidurl.com')
    click_button 'Submit'
    expect(page).not_to have_content 'www.theinvalidurl.com'
    expect(page).to have_content 'You must submit a valid URL.'
  end
end
