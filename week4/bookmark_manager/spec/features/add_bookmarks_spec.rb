require 'pg'

feature 'Add bookmarks' do
  scenario 'User can add bookmarks' do
    visit('/bookmarks/new')
    fill_in('url', :with => 'http://www.facebook.com')
    click_button 'Confirm bookmark'
    expect(page).to have_content 'http://www.facebook.com'
  end

  scenario 'Invalid URL' do
    visit('/bookmarks/new')
    fill_in('url', with: 'lalala')
    click_button('Confirm bookmark')
    expect(page).not_to have_content "lalala"
    expect(page).to have_content 'Invalid URL'
  end
end
