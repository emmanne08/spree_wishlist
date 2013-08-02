require 'spec_helper'

describe Spree::WishedProductsController do
  stub_authorization!

  let!(:user) { create(:user) }
  let!(:wished_product) { create(:wished_product) }
  let (:valid_attributes) { attributes_for(:wished_product) }

  before { controller.stub spree_current_user: user }

  it 'use Spree::WishedProductsController' do
    controller.should be_an_instance_of(Spree::WishedProductsController)
  end

  context '#create' do
    context 'with valid params' do
      it 'creates a new Spree::WishedProduct' do
        expect {
          spree_post :create, wished_product: valid_attributes
        }.to change(Spree::WishedProduct, :count).by(1)
      end

      it 'assigns a newly created wished_product as @wished_product' do
        spree_post :create, wished_product: valid_attributes
        assigns(:wished_product).should be_a Spree::WishedProduct
        assigns(:wished_product).should be_persisted
      end

      xit 'redirects to the created wished_product' do
        spree_post :create, wished_product: valid_attributes
        response.should redirect_to Spree::WishedProduct.last
      end
    end

    context 'with invalid params' do
      before do
        Spree::WishedProduct.any_instance.stub(:save).and_return(false)
        spree_post :create, wished_product: {}
      end
      it { assigns(:wished_product).should be_a_new Spree::WishedProduct }
      xit { response.should render_template :new }
    end
  end

  context '#update' do
    context 'with valid params' do
      xit 'updates the requested wished_product' do
        Spree::WishedProduct.any_instance.should_receive(:update_attributes).with({ 'these' => 'params' })
        spree_put :update, id: wished_product, wished_product: { 'these' => 'params' }
      end

      it 'assigns the requested wished_product as @wished_product' do
        spree_put :update, id: wished_product, wished_product: valid_attributes
        assigns(:wished_product).should eq wished_product
      end

      xit 'redirects to the wished_product' do
        spree_put :update, id: wished_product, wished_product: valid_attributes
        response.should redirect_to wished_product
      end
    end

    context 'with invalid params' do
      before do
        Spree::WishedProduct.any_instance.stub(:save).and_return(false)
        spree_put :update, id: wished_product, wished_product: {}
      end
      it { assigns(:wished_product).should eq wished_product }
      xit { response.should render_template :edit }
    end
  end

  context '#show' do
    xit 'assigns the requested wished_product as @wished_product' do
      spree_get :show, id: wished_product
      assigns(:wished_product).should eq wished_product
    end
  end

  context '#destroy' do
    xit 'destroys the requested wished_product' do
      expect {
        spree_delete :destroy, id: wished_product
      }.to change(Spree::WishedProduct, :count).by(-1)
    end

    xit 'redirects to the wished_products list' do
      spree_delete :destroy, id: wished_product
      response.should redirect_to wishlists_url
    end

    it 'requires the :id parameter' do
      expect { spree_delete :destroy }.to raise_error
    end
  end
end
