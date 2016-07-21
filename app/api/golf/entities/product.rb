class Golf::Entities::Product < Grape::Entity
  expose :id, documentation: { type: 'string', values: ['5790cbbf0013409b82794d1e'] } do |product, options|
    product._id.to_s
  end
  expose :name, documentation: { type: 'string', values: ['Small Package'] }
  expose :type, documentation: { type: 'string', values: ['Golf'] }
  expose :length, documentation: { type: 'integer', values: [100] }
  expose :width, documentation: { type: 'integer', values: [48] }
  expose :height, documentation: { type: 'integer', values: [32] }
  expose :weight, documentation: { type: 'integer', values: [8] }
end
