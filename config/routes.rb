Rails.application.routes.draw do
  get 'game', to: 'game#generate_grid'
  get 'score', to: 'score#run_game'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
