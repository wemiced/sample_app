require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  render_views

  before do
    @base_titre = "Simple App du Tutoriel Ruby on Rails |"
  end

  describe "GET #home" do
    before do
      get :home
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "doit avoir dans son title (HTML) le mot accueil" do
      expect(response.body).to have_title("#{@base_titre} Accueil")
    end
  end

  describe "GET #contact" do
    before do
      get :contact
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "doit avoir dans son title (HTML) le mot contact" do
      expect(response.body).to have_title("#{@base_titre} Contact")
    end
  end

  describe "GET #about" do
    before do
      get :about
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "doit avoir dans son title (HTML) le mot about" do
      expect(response.body).to have_title("#{@base_titre} About")
    end
  end

  describe "GET #help" do
    before do
      get :help
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "doit avoir dans son title (HTML) le mot help" do
      expect(response.body).to have_title("#{@base_titre} Help")
    end
  end

end
