module Golf
  class Products < Grape::API
    helpers Golf::Helpers

    resource :products do
      desc 'Create product' do
        http_codes [[201, 'Succsess create', Golf::Entities::ProductResponse]]
      end
      params do
        requires :product, type: Hash do
          requires :name, type: String, desc: 'Product name'
          requires :type, type: String, desc: 'Product type'
          requires :length, type: Integer, desc: 'Product length'
          requires :width, type: Integer, desc: 'Product width'
          requires :height, type: Integer, desc: 'Product height'
          requires :weight, type: Integer, desc: 'Product weight'
        end
      end
      post do
        product = Product.new(permitted_params.product)
        if product.save
          present({ product: product }, with: Golf::Entities::ProductResponse)
        else
          error! product.errors, :bad_request
        end
      end

      desc 'Products list' do
        http_codes [[200, 'Succsess', Golf::Entities::ProductsResponse]]
      end
      get do
        products = Product.all
        present({ products: products }, with: Golf::Entities::ProductsResponse)
      end

      desc 'Product that best matches by length, width, height, weight' do
        http_codes [[200, 'Matched product', Golf::Entities::ProductResponse]]
      end
      params do
        requires :length, type: Integer, desc: 'Product length'
        requires :width, type: Integer, desc: 'Product width'
        requires :height, type: Integer, desc: 'Product height'
        requires :weight, type: Integer, desc: 'Product weight'
      end
      get 'match' do
        product = Product.where(:length.gte => params[:length],
                                :width.gte => params[:width],
                                :height.gte => params[:height],
                                :weight.gte => params[:weight])
                         .order(:volume.asc, :weight.asc).first
        present({ product: product }, with: Golf::Entities::ProductResponse)
      end

      desc 'Update product' do
        http_codes [[202, 'Succsess update', Golf::Entities::ProductResponse]]
      end
      params do
        requires :id, type: String, desc: 'Product ID'
        requires :product, type: Hash do
          optional :name, type: String, desc: 'Product name'
          optional :type, type: String, desc: 'Product type'
          optional :length, type: Integer, desc: 'Product length'
          optional :width, type: Integer, desc: 'Product width'
          optional :height, type: Integer, desc: 'Product height'
          optional :weight, type: Integer, desc: 'Product weight'
        end
      end
      put ':id' do
        product = Product.find(params[:id])
        if product.update(permitted_params.product)
          status :accepted
          present({ product: product }, with: Golf::Entities::ProductResponse)
        else
          error! product.errors, :not_acceptable
        end
      end

      desc 'Delete product' do
        http_codes [[204, 'Succsess destroy', nil]]
      end
      params do
        requires :id, type: String, desc: 'Product ID'
      end
      delete ':id' do
        product = Product.find(params[:id])
        if product.destroy
          status :no_content
          nil
        else
          error! product.errors, :not_acceptable
        end
      end
    end
  end
end
