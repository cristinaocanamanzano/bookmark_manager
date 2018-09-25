feature 'View bookmarks' do
  scenario 'The user can see their bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.google.com"
    expect(page).to have_content "http://facebook.com"
  end
end
