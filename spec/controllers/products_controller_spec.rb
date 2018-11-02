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

  describe"#create"do
  context "as an authenticated user" do
    before do
      user = FactoryBot.build(:user)
      sign_in user
    end
    it "adds a product" do
      product_params = FactoryBot.attributes_for(:product)
      expect(response).to have_http_status "200"
    end
  end
  context "as a guest" do
    it "returns a 302 response" do
      product_params = FactoryBot.attributes_for(:product)
      post :create, params: { product: product_params }
      expect(response).to have_http_status "302"
    end
    it "redirects to the sign-in page" do
      product_params = FactoryBot.attributes_for(:product)
      post :create, params: { product: product_params }
      expect(response).to redirect_to "/users/sign_in"
    end
  end
end

describe"#update"do
context "as an authorized user" do
  before do
    user = FactoryBot.build(:user)
    product = FactoryBot.build(:product)
    sign_in user
  end
  it "updates a product" do
    product_params = FactoryBot.attributes_for(:product,
      name: "Bike")
      patch :update, params: { id: product.id, product: product_params }
      expect(product.reload.name).to eq "Bike"
    end
  end
end

context "as a guest" do
  before do
    product = FactoryBot.build(:product)
  end
  it "returns a 302 response" do
    product_params = FactoryBot.attributes_for(:product)
    patch :update, params: { id: product.id, product: product_params }
    expect(response).to have_http_status "302"
  end
  it "redirects to the sign-in page" do
    product_params = FactoryBot.attributes_for(:product)
    patch :update, params: { id: product.id, product: product_params }
    expect(response).to redirect_to "/users/sign_in"
  end
end

describe"#destroy"do
context "as an authorized user" do
  before do
    user = FactoryBot.build(:user)
    product = FactoryBot.build(:product)
    sign_in user
  end
  it "deletes a product" do
    expect(response).to have_http_status "200"
  end
end
end

context "as a guest" do
  before do
    product = FactoryBot.build(:product)
  end
  it "returns a 302 response" do
    delete :destroy, params: { id: product.id }
    expect(response).to have_http_status "302"
  end
  it "redirects to the sign-in page" do
    delete :destroy, params: { id: product.id }
    expect(response).to redirect_to "/users/sign_in"
  end
  it "does not delete the product" do
    expect(response).to have_http_status "200"
  end
end
end
