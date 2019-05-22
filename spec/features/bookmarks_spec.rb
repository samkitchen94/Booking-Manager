feature 'going on /bookmarks' do
  scenario 'see all the bookmarks' do 
    Bookmark.create(url: "http://www.google.com")

    visit('/bookmarks')
    expect(page).to have_content('http://www.google.com')
  end
end
