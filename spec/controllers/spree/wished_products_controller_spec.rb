require 'spec_helper'

describe Spree::WishedProductsController do
  stub_authorization!

  let!(:user) { create(:user) }
  let!(:wished_product) { create(:wished_product) }
  let (:valid_attributes) { attributes_for(:wished_product) }

  before { controller.stub spree_current_user: user }

  it "use Spree::WishedProductsController" do
    controller.should be_an_instance_of(Spree::WishedProductsController)
  end

  context "#create" do
    context "with valid params" do
      it "creates a new Spree::WishedProduct" do
        expect {
          spree_post :create, wished_product: valid_attributes
        }.to change(Spree::WishedProduct, :count).by(1)
      end

      it "assigns a newly created wished_product as @wished_product" do
        spree_post :create, wished_product: valid_attributes
        assigns(:wished_product).should be_a Spree::WishedProduct
        assigns(:wished_product).should be_persisted
      end

      it "redirects to the created wished_product" do
        pending "Expected response to be a redirect to <http://test.host/wished_products/2> but was a redirect to <http://test.host/wishlists/28ad0e285390b9d66e6f8388f5f614ea576409cb>"
        spree_post :create, wished_product: valid_attributes
        response.should redirect_to Spree::WishedProduct.last
      end
    end

    context "with invalid params" do
      before do
        Spree::WishedProduct.any_instance.stub(:save).and_return(false)
        spree_post :create, wished_product: {}
      end
      it { assigns(:wished_product).should be_a_new Spree::WishedProduct }
      # expecting <"new"> but rendering with <"">
      pending { response.should render_template :new }
    end
  end

  context "#update" do
    context "with valid params" do
      it "updates the requested wished_product" do
        pending "Expected response to be a redirect to <http://test.host/wished_products/1> but was a redirect to <http://test.host/wishlists/fb0fd8dc676b1bae7bd3af078409dc1b8396f4f2>"
        Spree::WishedProduct.any_instance.should_receive(:update_attributes).with({ 'these' => 'params' })
        spree_put :update, id: wished_product, wished_product: { 'these' => 'params' }
      end

      it "assigns the requested wished_product as @wished_product" do
        spree_put :update, id: wished_product, wished_product: valid_attributes
        assigns(:wished_product).should eq wished_product
      end

      it "redirects to the wished_product" do
        pending "Expected response to be a redirect to <http://test.host/wished_products/1> but was a redirect to <http://test.host/wishlists/3bce63cad0d9732c025bed7ba95ad90ccf54773d>"
        spree_put :update, id: wished_product, wished_product: valid_attributes
        response.should redirect_to wished_product
      end
    end

    context "with invalid params" do
      before do
        Spree::WishedProduct.any_instance.stub(:save).and_return(false)
        spree_put :update, id: wished_product, wished_product: {}
      end
      it { assigns(:wished_product).should eq wished_product }
      # expecting <"edit"> but rendering with <"">
      # it { response.should render_template :edit }
    end
  end

  context "#show" do
    it "assigns the requested wished_product as @wished_product" do
      pending "Expected response to be a redirect to <http://test.host/wished_products/1> but was a redirect to <http://test.host/wishlists/0ba9bd75e175cd5c149801076cb9469f653e88f6>"
      spree_get :show, id: wished_product
      assigns(:wished_product).should eq wished_product
    end
  end

  context "#destroy" do
    it "destroys the requested wished_product" do
      pending "Expected response to be a redirect to <http://test.host/wished_products/1> but was a redirect to <http://test.host/wishlists/63af1822fac11102b51c377e7f3ee0e98e2b3d2b>"
      expect {
        spree_delete :destroy, id: wished_product
      }.to change(Spree::WishedProduct, :count).by(-1)
    end

    it "redirects to the wished_products list" do
      pending "undefined local variable or method `wishlists_url' for #<RSpec::Core::ExampleGroup::Nested_1::Nested_4:0x007fb2af13ed40>"
      spree_delete :destroy, id: wished_product
      response.should redirect_to wishlists_url
    end

    it "requires the :id parameter" do
      expect { spree_delete :destroy }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
