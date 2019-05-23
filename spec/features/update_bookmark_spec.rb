feature "update bookmarks" do
  scenario "it updates an existing bookmark" do
    bookmark = Bookmark.create(url: 'https://www.google.com', title: 'Google')
    visit '/bookmarks'
    click_button('Update')
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/update"
    fill_in('url', with: 'https://www.google.co.uk')
    fill_in('title', with: 'Google UK')
    click_button('Submit')
    expect(current_path).to eq "/bookmarks"
    expect(page).not_to have_link("Google", href: 'https://www.google.com')
    expect(page).to have_link("Google UK", href: 'https://www.google.co.uk')
  end
end
