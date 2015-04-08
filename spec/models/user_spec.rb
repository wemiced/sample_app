require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = User.new(name: "Aymeric OuaisOuais",
                     email: "ouaisouais.aymeric@gmail.com",
                     password: "foobar",
                     password_confirmation: "foobar")
  end

  it "needs a name and an email" do
    expect(@user).to be_valid
  end

  it "needs to have no empty name to be valid" do
    @user.name = "    "
    expect(@user).not_to be_valid
  end

  it "needs to have no empty email to be valid" do
    @user.email = "    "
    expect(@user).not_to be_valid
  end

  it "name must have under 50 characteres" do
    @user.name = "a" * 51
    @user.email = "ouaisouais.aymeric@gmail.com"
    expect(@user).not_to be_valid
  end

  it "email must have under 255 characteres" do
    @user.name = "aymeric"
    @user.email = "a" * 250 + "@example.com"
    expect(@user).not_to be_valid
  end

  it "have to accept different kind of email" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      expect(@user).to be_valid
    end
  end

  it "have to reject different kind of email" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      expect(@user).not_to be_valid
    end
  end

  it "must have not two or more same emails in the database" do
    @user.save
    userdup = @user.dup
    userdup.name = "someoneelse"
    expect(userdup).not_to be_valid
  end

  it "must have not two or more same emails with different case in the database" do
    @user.save
    userdup = @user.dup
    userdup.email = @user.email.upcase
    expect(userdup).not_to be_valid
  end

  it "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    expect(@user).not_to be_valid
  end

end
