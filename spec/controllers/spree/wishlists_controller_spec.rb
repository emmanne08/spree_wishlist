require 'spec_helper'

describe Spree::WishlistsController do
  stub_authorization!

  let!(:user) { create(:user) }
  let!(:wishlist) { create(:wishlist) }
  let (:valid_attributes) { attributes_for(:wishlist) }

  before { controller.stub spree_current_user: user }

  it "use Spree::WishlistsController" do
    controller.should be_an_instance_of(Spree::WishlistsController)
  end

  context "GET#new" do
    it "assigns a new wishlist as @wishlist" do
      spree_get :new
      assigns(:wishlist).should be_a_new Spree::Wishlist
    end
  end

  context "GET#index" do
    it "assigns all wishlists as @wishlists" do
      pending "empty array? probably need to fix factory so its populated correctly"
      spree_get :index
      assigns(:wishlists).should eq [wishlist]
    end
  end

  context "GET#edit" do
    it "assigns the requested wishlist as @wishlist" do
      spree_get :edit, id: wishlist
      assigns(:wishlist).should eq wishlist
    end
  end

  context "PUT#update" do
    context "with valid params" do
      it "updates the requested wishlist" do
        Spree::Wishlist.any_instance.should_receive(:update_attributes).with({ 'these' => 'params' })
        spree_put :update, id: wishlist, wishlist: { 'these' => 'params' }
      end

      it "assigns the requested wishlist as @wishlist" do
        spree_put :update, id: wishlist, wishlist: valid_attributes
        assigns(:wishlist).should eq wishlist
      end

      it "redirects to the wishlist" do
        spree_put :update, id: wishlist, wishlist: valid_attributes
        response.should redirect_to wishlist
      end
    end

    context "with invalid params" do
      before do
        Spree::Wishlist.any_instance.stub(:save).and_return(false)
        spree_put :update, id: wishlist, wishlist: {}
      end
      it { assigns(:wishlist).should eq wishlist }
      # expecting <"edit"> but rendering with <"">
      pending { response.should render_template :edit }
    end
  end

  context "GET#show" do
    it "assigns the requested wishlist as @wishlist" do
      spree_get :show, id: wishlist
      assigns(:wishlist).should eq wishlist
    end
  end

  pending "GET#default" do
    it "assigns the requested wishlist as @wishlist" do
      spree_get :default
      assigns(:wishlist).should eq wishlist
    end
    it { response.should render_template :show }
  end

  context "POST#create" do
    context "with valid params" do
      it "creates a new Spree::Wishlist" do
        expect {
          spree_post :create, wishlist: valid_attributes
        }.to change(Spree::Wishlist, :count).by(1)
      end

      it "assigns a newly created wishlist as @wishlist" do
        spree_post :create, wishlist: valid_attributes
        assigns(:wishlist).should be_a Spree::Wishlist
        assigns(:wishlist).should be_persisted
      end

      it "redirects to the created wishlist" do
        spree_post :create, wishlist: valid_attributes
        response.should redirect_to Spree::Wishlist.last
      end
    end

    context "with invalid params" do
      before do
        Spree::Wishlist.any_instance.stub(:save).and_return(false)
        spree_post :create, wishlist: {}
      end
      it { assigns(:wishlist).should be_a_new Spree::Wishlist }
      # expecting <"new"> but rendering with <"">
      pending { response.should render_template :new }
    end
  end

  context "DELETE#destroy" do
    it "destroys the requested wishlist" do
      expect {
        spree_delete :destroy, id: wishlist
      }.to change(Spree::Wishlist, :count).by(-1)
    end

    it "redirects to the wishlists list" do
      pending "undefined local variable or method `wishlists_url'"
      spree_delete :destroy, id: wishlist
      response.should redirect_to wishlists_url
    end

    it "requires the :id parameter" do
      pending "expected ActionController::RoutingError, got #<NoMethodError: undefined method `destroy' for nil:NilClass> with backtrace:"
      expect { spree_delete :destroy }.to raise_error(ActionController::RoutingError)
    end
  end
end
