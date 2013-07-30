require 'spec_helper'

describe Spree::WishlistsController do
  stub_authorization!

  let!(:user) { create(:user) }
  let!(:wishlist) { create(:wishlist, user: user) }
  let(:valid_attributes) { attributes_for(:wishlist) }

  before { controller.stub spree_current_user: user }

  it "use Spree::WishlistsController" do
    controller.should be_an_instance_of(Spree::WishlistsController)
  end

  context "#new" do
    it "assigns a new wishlist as @wishlist" do
      spree_get :new
      assigns(:wishlist).should be_a_new Spree::Wishlist
    end
  end

  context "#index" do
    it "assigns all wishlists as @wishlists" do
      spree_get :index
      assigns(:wishlists).should eq user.wishlists
    end
  end

  context "#edit" do
    it "assigns the requested wishlist as @wishlist" do
      spree_get :edit, id: wishlist
      assigns(:wishlist).should eq wishlist
    end
  end

  context "#update" do
    it "updates the requested wishlist with some wishlist parameters" do
      Spree::Wishlist.any_instance.should_receive(:update_attributes).with({ 'these' => 'params' })
      spree_put :update, id: wishlist, wishlist: { 'these' => 'params' }
    end

    it "assigns @wishlist" do
      spree_put :update, id: wishlist
      assigns(:wishlist).should eq wishlist
    end

    context "when the wishlist updates successfully" do
      before :each do
        spree_put :update, id: wishlist, wishlist: valid_attributes
      end

      it "redirects to the updated wishlist" do
        response.should redirect_to wishlist
      end

      it "sets the attributes of @wishlist according to valid_attributes" do
        valid_attributes.each do |attr_name, value|
          assigns(:wishlist).send(attr_name).should eq value
        end
      end
    end

    context "when the wishlist fails to update" do
      before :each do
        spree_put :update, id: wishlist, wishlist: {}
      end

      it "redirects to the non-updated wishlist" do
        response.should redirect_to wishlist
      end

      it "sets the attributes of @wishlist according to wishlist's initial attributes" do
        exclude = ["created_at", "updated_at"]
        Spree::Wishlist.attribute_names.
          reject { |attr_name| exclude.include?(attr_name) }.
          each do |attr_name|
            assigns(:wishlist).send(attr_name).should eq wishlist.send(attr_name)
          end
      end
    end
  end

  context "#show" do
    it "assigns the requested wishlist as @wishlist" do
      spree_get :show, id: wishlist
      assigns(:wishlist).should eq wishlist
    end
  end

  context "#default" do
    it "retrieves the default wishlist of the current user" do
      Spree::User.any_instance.should_receive(:wishlist)
      spree_get :default
    end

    it "assigns the default wishlist as @wishlist" do
      spree_get :default
      assigns(:wishlist).should eq user.wishlist
    end

    it "renders the wishlists/show template" do
      spree_get :default
      response.should render_template "spree/wishlists/show"
    end
  end

  context "#create" do
    it "creates a new wishlist with some wishlist parameters" do
      Spree::Wishlist.should_receive(:new).
        with({ 'these' => 'params' }).
        and_return(mock_model(Spree::Wishlist).as_null_object)
      spree_post :create, wishlist: { 'these' => 'params' }
    end

    it "assigns @wishlist" do
      spree_post :create
      assigns(:wishlist).should be_an_instance_of(Spree::Wishlist)
    end

     it "sets the current user as the user of @wishlist" do
       spree_post :create
       assigns(:wishlist).user.should eq user
     end

    context "when the wishlist saves successfully" do
      before :each do
        spree_post :create, wishlist: valid_attributes
      end

      it "saves the new wishlist" do
        expect {
          spree_post :create, wishlist: valid_attributes
        }.to change(Spree::Wishlist, :count).by(1)
      end

      it "redirects to the newly created wishlist" do
        response.should redirect_to user.wishlists.last
      end

      it "sets the attributes of @wishlist according to valid_attributes" do
        valid_attributes.each do |attr_name, value|
          assigns(:wishlist).send(attr_name).should eq value
        end
      end
    end

    context "when the wishlist fails to save" do
      before :each do
        spree_post :create, wishlist: {}
      end

      it "renders the wishlists/new template" do
        response.should render_template "spree/wishlists/new"
      end

      it "doesn't save the new wishlist" do
        assigns(:wishlist).should be_a_new Spree::Wishlist
      end
    end
  end

  context "#destroy" do
    it "destroys the requested wishlist" do
      expect {
        spree_delete :destroy, id: wishlist
      }.to change(Spree::Wishlist, :count).by(-1)
    end

    it "redirects to the user's account page" do
      spree_delete :destroy, id: wishlist
      response.should redirect_to spree.account_path
    end
  end
end
