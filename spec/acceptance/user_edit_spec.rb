require 'spec_helper'

feature 'Edit user' do

  before do
    visit(login_path)
    @user = create(:user)
    fill_in "session[email]", with: @user.email
    fill_in "session[password]", with: @user.password
    click_button('Log in')
    click_link('Settings')
  end

  scenario 'with right user information' do
    click_button("Save changes")
    expect(page).to have_selector(".alert.alert-success")
  end

  scenario 'with wrong name' do
    expect(page).to have_selector(".form-control#user_name")
    fill_in "user[name]", with: ""
    click_button("Save changes")
    expect(page).to have_selector(".alert.alert-danger")
  end

  scenario 'with wrong email' do
    expect(page).to have_selector(".form-control#user_name")
    fill_in "user[email]", with: "invalid@email"
    click_button("Save changes")
    expect(page).to have_selector(".alert.alert-danger")
  end

  scenario 'with wrong password lenght' do
    expect(page).to have_selector(".form-control#user_name")
    fill_in "user[password]", with: "azert"
    fill_in "user[password_confirmation]", with: "azert"
    click_button("Save changes")
    expect(page).to have_selector(".alert.alert-danger")
  end

  scenario 'with wrong password confirmation' do
    expect(page).to have_selector(".form-control#user_name")
    fill_in "user[password]", with: "azerty"
    fill_in "user[password_confirmation]", with: "12345"
    click_button("Save changes")
    expect(page).to have_selector(".alert.alert-danger")
  end

end
