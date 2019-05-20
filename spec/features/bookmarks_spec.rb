feature 'going on /bookmarks' do
  scenario 'see all the bookmarks' do 
  	visit('/bookmarks')
  	expect(page).to have_content('http://google.co.uk')
  end
end