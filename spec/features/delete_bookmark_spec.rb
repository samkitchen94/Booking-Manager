feature 'deleting a bookmark' do
    scenario 'should have a delete bookmark feature' do
    visit '/bookmarks/new'
    fill_in 'url', with: 'http://www.google.com'
    fill_in 'title', with: 'Google'
    click_button 'Submit'
    click_button 'Delete'
    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Google', href: 'http://www.google.com')
  end
end
