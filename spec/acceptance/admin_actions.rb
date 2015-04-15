require 'spec_helper'

feature 'Admin actions' do

  before do
    visit(login_path)
    @user = create(:user, name: "Georgin Aymeric", email: "georgin.aymeric@gmail.com", password: "dede57", password_confirmation: "dede57", admin: true)
    fill_in "session[email]", with: @user.email
    fill_in "session[password]", with: @user.password
    10.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password = "password"
      User.create!(name:  name,
                   email: email,
                   password:              password,
                   password_confirmation: password)
    end
    click_button('Log in')
    click_link('Users')
  end

  #test TODO

end
