require 'spec_helper'



feature "Visitor signs up"  do

  before do
    visit(signup_path)
  end

  scenario "with valid user" do
    fill_in "user[name]", with: 'Mic'
    fill_in "user[email]", with: 'valid@email.com'
    fill_in "user[password]", with: 'trololo'
    fill_in "user[password_confirmation]", with: 'trololo'
    click_button('Create my account')
    expect(page).to have_selector(".alert-success")
  end

  scenario "with invalid user name" do
    fill_in "user[name]", with: '  '
    fill_in "user[email]", with: 'valid@email.com'
    fill_in "user[password]", with: 'trololo'
    fill_in "user[password_confirmation]", with: 'trololo'
    click_button('Create my account')
    expect(page).to have_selector(".field_with_errors #user_name")
  end

  scenario "with invalid user email" do
    fill_in "user[name]", with: 'Mic'
    fill_in "user[email]", with: 'invalid@email'
    fill_in "user[password]", with: 'trololo'
    fill_in "user[password_confirmation]", with: 'trololo'
    click_button('Create my account')
    expect(page).to have_selector(".field_with_errors #user_email")
  end

  scenario "with invalid user password" do
    fill_in "user[name]", with: 'Mic'
    fill_in "user[email]", with: 'valid@email.com'
    fill_in "user[password]", with: 'trolo'
    fill_in "user[password_confirmation]", with: 'trolo'
    click_button('Create my account')
    expect(page).to have_selector(".field_with_errors #user_password")
  end

  scenario "with invalid user password_confirmation" do
    fill_in "user[name]", with: 'Mic'
    fill_in "user[email]", with: 'valid@email.com'
    fill_in "user[password]", with: 'trololo'
    fill_in "user[password_confirmation]", with: 'somethingelse'
    click_button('Create my account')
    expect(page).to have_selector(".field_with_errors #user_password_confirmation")
  end

end
