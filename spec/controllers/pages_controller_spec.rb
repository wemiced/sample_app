require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  render_views

  describe "GET #home" do
    before do
      get :home
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "doit avoir dans son title (HTML) le mot accueil" do
      expect(response.body).to have_title("Accueil")
    end
  end

  describe "GET #contact" do
    before do
      get :contact
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "doit avoir dans son title (HTML) le mot accueil" do
      expect(response.body).to have_title("Contact")
    end
  end

  describe "GET #about" do
    before do
      get :about
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "doit avoir dans son title (HTML) le mot accueil" do
      expect(response.body).to have_title("About")
    end
  end

end
