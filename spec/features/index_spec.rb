feature 'homepage' do
  scenario 'should show a welcome message' do 
  	visit '/'
  	expect(page).to have_content('Hello, world')
  end
end