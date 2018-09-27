require 'pg'


feature 'Add bookmarks' do
  scenario 'User can add bookmarks' do
    visit('/bookmarks/new')
    fill_in('url', :with => 'http://www.facebook.com')
    fill_in('title', :with => 'Facebook')
    click_button 'Confirm bookmark'
    expect(page).to have_content 'Facebook'
  end

  scenario 'Invalid URL' do
    visit('/bookmarks/new')
    fill_in('url', with: 'google')
    fill_in('title', with: 'Google')
    click_button('Confirm bookmark')
    expect(page).not_to have_content "Google"
    expect(page).to have_content 'Invalid URL'
  end
end
