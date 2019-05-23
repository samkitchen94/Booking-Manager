require 'bookmark'
require 'database_helpers'

describe Bookmark do

  describe ".all" do
    it 'returns a list of bookmarks' do
  	  con = PG.connect(dbname: 'bookmark_manager_test')

      bookmark = Bookmark.create(url: "http://www.google.com", title: 'Google')

	    bookmarks = Bookmark.all

	    expect(bookmarks.length).to eq 1
	    expect(bookmarks.first).to be_a Bookmark
	    expect(bookmarks.first.id).to eq bookmark.id
	    expect(bookmarks.first.title).to eq 'Google'
	    expect(bookmarks.first.url).to eq 'http://www.google.com'
	  end
  end

  describe '.create' do
    it 'adds a new bookmark title to the database' do
      bookmark = Bookmark.create(url: 'http://www.google.com', title: 'Google')

      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.url).to eq 'http://www.google.com'
      expect(bookmark.title).to eq 'Google'
    end
  end

  describe '.delete' do
    it 'deletes a bookmark from the database' do
      bookmark = Bookmark.create(url: 'http://www.google.com', title: 'Google')
      Bookmark.delete(id: bookmark.id)
      expect(Bookmark.all.length).to eq(0)
    end
  end

  describe '.update' do
    it 'updates a bookmark from the database' do
      bookmark = Bookmark.create(url: 'http://www.google.com', title: 'Google')
      updated_bookmark = Bookmark.update(id: bookmark.id, url: 'http://www.google.co.uk', title: 'Google UK')

      expect(updated_bookmark).to be_a Bookmark
      expect(updated_bookmark.id).to eq(bookmark.id)
      expect(updated_bookmark.title).to eq('Google UK')
      expect(updated_bookmark.url).to eq('http://www.google.co.uk')
    end
  end

  describe '.find' do
    it "finds a bookmark in the table" do
      bookmark = Bookmark.create(url: 'http://www.google.com', title: 'Google')
      found_bookmark = Bookmark.find(id: bookmark.id)

      expect(found_bookmark).to be_a Bookmark
      expect(found_bookmark.id).to eq(bookmark.id)
      expect(found_bookmark.title).to eq('Google')
      expect(found_bookmark.url).to eq('http://www.google.com')
    end
  end
end
