require 'bookmark'

describe Bookmark do

  it 'contains a list of bookmarks' do
  	con = PG.connect(dbname: 'bookmark_manager_test')
  	con.exec("INSERT INTO bookmarks VALUES(1, 'http://www.google.com');")

    bookmarks = Bookmark.all

    expect(bookmarks).to include("http://www.google.com")
  end

  describe '.create' do
    it 'adds a new bookmark to the list' do
      Bookmark.create(url: 'http://www.google.com')
      expect(Bookmark.all).to include('http://www.google.com')
    end
  end

end
 