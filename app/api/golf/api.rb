module Golf
  class API < Grape::API
    prefix :api
    format :json
    default_format :json

    rescue_from Grape::Exceptions::ValidationErrors do |e|
      error!({ error: e }, 400)
    end
    rescue_from Mongoid::Errors::DocumentNotFound do |e|
      error!({ error: e }, 404)
    end
    rescue_from :all

    mount Golf::Products

    add_swagger_documentation(
      hide_documentation_path: true,
      hide_format: true
    )
  end
end
