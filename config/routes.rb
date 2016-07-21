Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount GrapeSwaggerRails::Engine => '/api_documentation'
  mount Golf::API => '/'
  mount_ember_app :frontend, to: '/'
end
