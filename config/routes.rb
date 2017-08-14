Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get '/restaurants/search', to: 'restaurants#get_restaurants_from_yelp_by_city'
    end
  end
end
