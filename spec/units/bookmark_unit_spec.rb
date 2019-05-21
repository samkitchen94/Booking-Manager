require 'bookmark'

describe Bookmark do

  it 'contains a list of bookmarks' do
    bookmarks = Bookmark.all
    expect(bookmarks).to include("http://www.google.com")
  end

end
