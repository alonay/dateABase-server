Rails.application.routes.draw do
  resources :person_chars
  resources :chars
  resources :persons
  resources :characteristics, :person, :attribute_entry
end
