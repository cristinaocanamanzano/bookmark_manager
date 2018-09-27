require 'pg'

feature 'View bookmarks' do
  scenario 'The user can see their bookmarks' do
    Bookmark.create(url: "http://www.makersacademy.com", title: "MakersAcademy")
    Bookmark.create(url: "http://www.google.com", title: "Google")
    Bookmark.create(url: "http://www.destroyallsoftware.com", title: "DestroyAll")

    visit('/bookmarks')
    expect(page).to have_link("MakersAcademy", href: "http://www.makersacademy.com")
    expect(page).to have_link("Google", href: "http://www.google.com")
    expect(page).to have_link("DestroyAll", href: "http://www.destroyallsoftware.com")
  end
end
