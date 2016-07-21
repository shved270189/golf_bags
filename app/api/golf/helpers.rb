module Golf
  module Helpers
    extend Grape::API::Helpers

    def permitted_params
      declared(params, include_missing: false)
    end
  end
end
