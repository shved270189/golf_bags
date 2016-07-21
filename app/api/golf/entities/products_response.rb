class Golf::Entities::ProductsResponse < Grape::Entity
  expose :products, using: Golf::Entities::Product, documentation: { type: 'Golf::Entities::Product', is_array: true }
end
