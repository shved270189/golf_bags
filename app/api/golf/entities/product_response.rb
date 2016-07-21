class Golf::Entities::ProductResponse < Grape::Entity
  expose :product, using: Golf::Entities::Product, documentation: { type: 'Golf::Entities::Product', is_array: false }
end
