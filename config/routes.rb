TechRadarGame::Application.routes.draw do
  get '/auth/:provider/callback', to: 'session#create'
  get '/logout', to: 'session#destroy'
  get '/won_card/:uuid', to: 'main#won_card'
  get '/login', to: 'main#login'
  get '/profile/:id', to: 'main#profile'
  get '/status_board', to: 'main#status_board'
  get '/timeline', to: 'main#timeline'
  get '/timeline_updates', to: 'main#timeline_updates'
  root 'main#timeline'
end
