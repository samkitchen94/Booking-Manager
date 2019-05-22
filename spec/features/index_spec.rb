feature 'homepage' do
  scenario 'should show a welcome message' do 
    visit '/'
    expect(page).to have_content('Bookmark Manager')
  end

  scenario 'should have a new bookmark feature' do

  	# con = PG.connect(dbname: 'bookmark_manager_test')
    # con.exec("INSERT INTO bookmarks VALUES(1, 'http://www.google.com');")

  	visit '/'
  	click_button 'Add Link'
  	expect(page).to have_field 'url'
  	expect(page).to have_button 'Submit'
  	fill_in 'url', with: 'http://www.google.com' 
  	click_button 'Submit'
  	expect(page).to have_content 'http://www.google.com'
  end
end
