feature "Add bookmarks" do
  scenario "add bookmarks to the bookmark list" do
    visit('/bookmarks')
    fill_in 'bookmark', with: 'https://youtube.com'
    click_button 'Submit'   
    expect(page).to have_content('https://youtube.com')
  end
end
