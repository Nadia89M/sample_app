require 'rails_helper'

describe ProductsController do

  let(:product) { Product.create!(name: 'Bike', id: 1) }


  describe "GET index" do
    it "renders the index template" do
      get :index
      expect(response.status).to eq(200)
      expect(response).to render_template(:index)
    end
  end

  describe "GET show" do
    it "renders the show template" do
      get :show, params: { id: product.id }
      expect(response.status).to eq(200)
      expect(response).to render_template(:show)
    end
  end

end
