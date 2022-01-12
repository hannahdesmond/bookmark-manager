feature "Add bookmarks" do
  scenario "add bookmarks to the bookmark list" do
    visit('/bookmarks')
    fill_in 'Bookmark', with: 'https://youtube.com'
    click_button 'Submit'   
    expect(page).to have_content('http://youtube.com')
  end
end
