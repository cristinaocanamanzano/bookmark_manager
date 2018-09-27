require 'pg'

feature 'Delete bookmark' do
  it 'allows user to delete bookmark from bookmark list' do
    Bookmark.create(url: "http://www.makersacademy.com", title: "MakersAcademy")
    Bookmark.create(url: "http://www.google.com", title: "Google")
    visit('/bookmarks')
    first('.bookmark').click_button 'Delete'
    expect(page).not_to have_link("MakersAcademy", href: "http://www.makersacademy.com")
  end
end
