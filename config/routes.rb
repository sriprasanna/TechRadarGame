TechRadarGame::Application.routes.draw do
  get '/auth/:provider/callback', to: 'session#create'
  get '/logout', to: 'session#destroy'
end
