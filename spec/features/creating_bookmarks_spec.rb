feature 'page for adding a new bookmark' do
    scenario 'should have a new bookmark feature' do
    visit '/'
    click_button 'Add Link'
    expect(page).to have_field 'url'
    expect(page).to have_field 'title'
    expect(page).to have_button 'Submit'
    fill_in 'url', with: 'http://www.google.com'
    fill_in 'title', with: 'Google'
    click_button 'Submit'
    expect(page).to have_link('Google', href: 'http://www.google.com')
  end
end
