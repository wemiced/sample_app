module ApplicationHelper

  def titre
    base_titre = "Simple App du Tutoriel Ruby on Rails"
    if content_for?(:title)
      "#{base_titre} | #{content_for(:title)}"
    else
      base_titre
    end
  end
end
