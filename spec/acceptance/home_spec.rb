require 'spec_helper'

feature "Home" do
  scenario "has links to other pages" do
    visit root_path
    expect(page).to have_link('About', href: about_path)
    expect(page).to have_link('Home', href: root_path)
    expect(page).to have_link('Contact', href: contact_path)
    expect(page).to have_link('Help', href: help_path)
  end
end
