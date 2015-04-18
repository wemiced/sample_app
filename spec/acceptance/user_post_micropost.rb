require 'rails_helper'

RSpec.describe Micropost, type: :model do

  feature "Micropost" do

    before do
      @user = create()
      visit(login_path)
      # This code is not idiomatically correct.
      fill_in("user[email]", @user.email)
      fill_in("user[password]", @user.password)
      click_button("Log in")
      visit(micropost_path)
    end

    scenario "post a valid micropost" do
      @micropost = Micropost.new(content: "Lorem ipsum", user_id: @user.id)
      expect(page).to have_selector(".alert-success")
    end

    scenario "post an invalid micropost" do
      @micropost = Micropost.new(content: "O"*145, user_id: @user.id)
      expect(page).to have_selector(".alert-danger")
    end

  end

end
