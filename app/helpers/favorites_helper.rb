# typed: false
# frozen_string_literal: true

module FavoritesHelper
  def fave_or_unfave_button(task, favorite)
    if favorite
      button_to("♡ Unfave", task_favorite_path(task, favorite), method: :delete)
    else
      button_to("♥️ Fave", task_favorites_path(task))
    end
  end
end
