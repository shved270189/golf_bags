require 'rails_helper'

describe Golf::Products do
  context 'POST /api/products' do
    let(:request_params) { attributes_for(:product) }
    let(:create_request) { post '/api/products', params: { product: request_params } }
    let(:response_body) { JSON.parse(response.body) }
    let(:response_product) { response_body['product'] }

    it { expect { create_request }.to change { Product.count }.from(0).to(1) }

    context 'check response' do
      before { create_request }

      it { expect(response.status).to eq(201) }
      it { expect(response_body).to include('product') }
      it { expect(response_product).to include('id') }
      it { expect(response_product['name']).to eq request_params[:name] }
      it { expect(response_product['type']).to eq request_params[:type] }
      it { expect(response_product['length']).to eq request_params[:length] }
      it { expect(response_product['width']).to eq request_params[:width] }
      it { expect(response_product['height']).to eq request_params[:height] }
      it { expect(response_product['weight']).to eq request_params[:weight] }
    end

    context 'check db' do
      let(:product) { Product.find(response_product['id']) }

      before { create_request }

      it { expect(product.name).to eq request_params[:name] }
      it { expect(product.type).to eq request_params[:type] }
      it { expect(product.length).to eq request_params[:length] }
      it { expect(product.width).to eq request_params[:width] }
      it { expect(product.height).to eq request_params[:height] }
      it { expect(product.weight).to eq request_params[:weight] }
    end
  end

  context 'GET /api/products' do
    let!(:products) { create_list(:product, 10) }
    let(:list_request) { get '/api/products' }
    let(:response_body) { JSON.parse(response.body) }
    let(:response_products) { response_body['products'] }

    context 'check response' do
      before { list_request }

      it { expect(response.status).to eq(200) }
      it { expect(response_body).to include('products') }
      it { expect(response_products.count).to eq 10 }
    end
  end

  context 'GET /api/products/match' do
    let(:products) { create_list(:product, 10) }
    let(:product) { products.last }
    let(:request_params) { { length: product.length, width: product.width, height: product.height, weight: product.weight } }
    let(:match_request) { get '/api/products/match', params: request_params }
    let(:response_body) { JSON.parse(response.body) }
    let(:response_product) { response_body['product'] }

    context 'check response' do
      before { match_request }

      it { expect(response.status).to eq(200) }
      it { expect(response_body).to include('product') }
      it { expect(response_product).to include('id') }
    end
  end

  context 'PUT /api/products/:id' do
    let!(:product) { create(:product) }
    let(:request_params) { attributes_for(:product) }
    let(:update_request) { put "/api/products/#{product._id}", params: { product: request_params } }
    let(:response_body) { JSON.parse(response.body) }
    let(:response_product) { response_body['product'] }

    context 'check response' do
      before { update_request }

      it { expect(response.status).to eq(202) }
      it { expect(response_body).to include('product') }
      it { expect(response_product).to include('id') }
      it { expect(response_product['name']).to eq request_params[:name] }
      it { expect(response_product['type']).to eq request_params[:type] }
      it { expect(response_product['length']).to eq request_params[:length] }
      it { expect(response_product['width']).to eq request_params[:width] }
      it { expect(response_product['height']).to eq request_params[:height] }
      it { expect(response_product['weight']).to eq request_params[:weight] }
    end

    context 'check db' do
      before do
        update_request
        product.reload
      end

      it { expect(product.name).to eq request_params[:name] }
      it { expect(product.type).to eq request_params[:type] }
      it { expect(product.length).to eq request_params[:length] }
      it { expect(product.width).to eq request_params[:width] }
      it { expect(product.height).to eq request_params[:height] }
      it { expect(product.weight).to eq request_params[:weight] }
    end
  end

  context 'DELETE /api/products/:id' do
    let!(:product) { create(:product) }
    let(:delete_request) { delete "/api/products/#{product._id}" }

    it { expect { delete_request }.to change { Product.count }.from(1).to(0) }

    context 'check response' do
      before { delete_request }

      it { expect(response.status).to eq(204) }
      it { expect(response.body).to eq '' }
    end
  end
end
