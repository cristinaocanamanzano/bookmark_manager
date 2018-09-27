require 'bookmark'
require 'pg'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      Bookmark.create(url: 'http://www.makersacademy.com', title: "MakersAcademy")
      Bookmark.create(url: 'http://www.google.com', title: "Google")
      Bookmark.create(url: 'http://www.destroyallsoftware.com', title: "DestroyAll")

      bookmarks = Bookmark.all
      bookmark = Bookmark.all.first

      expect(bookmarks.length).to eq 3
      expect(bookmark).to be_a Bookmark
      expect(bookmark).to respond_to(:id)
      expect(bookmark.title).to eq 'MakersAcademy'
      expect(bookmark.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'TestBookmark')

      expect(bookmark).to be_a Bookmark
      expect(bookmark).to respond_to(:id)
      expect(bookmark.title).to eq "TestBookmark"
    end

    it 'does not create a new bookmark if the URL is ot valid' do
      bookmark = Bookmark.create(url: 'lalala', title: 'lalala')
      expect(Bookmark.all).not_to be_a Bookmark
    end
  end

  describe '.delete' do
    it 'deletes a bookmark' do
      bookmark = Bookmark.create(url: 'http://www.makers.com', title: 'Makers')
      bookmarks = Bookmark.all
      Bookmark.delete(id: bookmark.id)
      expect(Bookmark.all.length).to eq 0
    end
  end
end
