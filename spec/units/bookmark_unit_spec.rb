require 'bookmark'

describe Bookmark do
  
  it 'responds to .all method' do
    expect(Bookmark).to respond_to(:all)
  end

  it 'contains an array of URLs' do
    expect(Bookmark.all).to include("http://google.co.uk")
  end

end
