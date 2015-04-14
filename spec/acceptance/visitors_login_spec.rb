require 'spec_helper'

feature "Visitor logging"  do

  before do
    visit(login_path)
  end

  scenario "login with invalid information" do
    fill_in "session[email]", with: ""
    fill_in "session[password]", with: ""
    click_button('Log in')
    expect(page).to have_selector(".alert-danger")
    visit(about_path)
    expect(page).not_to have_selector(".alert-danger")
  end

  scenario "login with valid information" do
    user = create(:user, email: "mic@example.com", password:"azerty")
    fill_in "session[email]", with: "mic@example.com"
    fill_in "session[password]", with: "azerty"
    click_button('Log in')
    expect(page).to have_content("Log out")
  end

  scenario "logging out" do
    user = create(:user, email: "mic@example.com", password:"azerty")
    fill_in "session[email]", with: "mic@example.com"
    fill_in "session[password]", with: "azerty"
    click_button('Log in')
    click_link('Log out')
    expect(page).to have_content("Log in")
  end

end
