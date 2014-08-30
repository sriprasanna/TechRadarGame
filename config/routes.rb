TechRadarGame::Application.routes.draw do
  get '/auth/:provider/callback', to: 'session#create'
  get '/logout', to: 'session#destroy'
  get '/won_card/:uuid', to: 'main#won_card'
  get '/login', to: 'main#login'
end
