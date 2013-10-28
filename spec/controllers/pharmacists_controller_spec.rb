require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe PharmacistsController do

  # This should return the minimal set of attributes required to create a valid
  # Pharmacist. As you add validations to Pharmacist, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "first_name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PharmacistsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all pharmacists as @pharmacists" do
      pharmacist = Pharmacist.create! valid_attributes
      get :index, {}, valid_session
      assigns(:pharmacists).should eq([pharmacist])
    end
  end

  describe "GET show" do
    it "assigns the requested pharmacist as @pharmacist" do
      pharmacist = Pharmacist.create! valid_attributes
      get :show, {:id => pharmacist.to_param}, valid_session
      assigns(:pharmacist).should eq(pharmacist)
    end
  end

  describe "GET new" do
    it "assigns a new pharmacist as @pharmacist" do
      get :new, {}, valid_session
      assigns(:pharmacist).should be_a_new(Pharmacist)
    end
  end

  describe "GET edit" do
    it "assigns the requested pharmacist as @pharmacist" do
      pharmacist = Pharmacist.create! valid_attributes
      get :edit, {:id => pharmacist.to_param}, valid_session
      assigns(:pharmacist).should eq(pharmacist)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Pharmacist" do
        expect {
          post :create, {:pharmacist => valid_attributes}, valid_session
        }.to change(Pharmacist, :count).by(1)
      end

      it "assigns a newly created pharmacist as @pharmacist" do
        post :create, {:pharmacist => valid_attributes}, valid_session
        assigns(:pharmacist).should be_a(Pharmacist)
        assigns(:pharmacist).should be_persisted
      end

      it "redirects to the created pharmacist" do
        post :create, {:pharmacist => valid_attributes}, valid_session
        response.should redirect_to(Pharmacist.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved pharmacist as @pharmacist" do
        # Trigger the behavior that occurs when invalid params are submitted
        Pharmacist.any_instance.stub(:save).and_return(false)
        post :create, {:pharmacist => { "first_name" => "invalid value" }}, valid_session
        assigns(:pharmacist).should be_a_new(Pharmacist)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Pharmacist.any_instance.stub(:save).and_return(false)
        post :create, {:pharmacist => { "first_name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested pharmacist" do
        pharmacist = Pharmacist.create! valid_attributes
        # Assuming there are no other pharmacists in the database, this
        # specifies that the Pharmacist created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Pharmacist.any_instance.should_receive(:update).with({ "first_name" => "MyString" })
        put :update, {:id => pharmacist.to_param, :pharmacist => { "first_name" => "MyString" }}, valid_session
      end

      it "assigns the requested pharmacist as @pharmacist" do
        pharmacist = Pharmacist.create! valid_attributes
        put :update, {:id => pharmacist.to_param, :pharmacist => valid_attributes}, valid_session
        assigns(:pharmacist).should eq(pharmacist)
      end

      it "redirects to the pharmacist" do
        pharmacist = Pharmacist.create! valid_attributes
        put :update, {:id => pharmacist.to_param, :pharmacist => valid_attributes}, valid_session
        response.should redirect_to(pharmacist)
      end
    end

    describe "with invalid params" do
      it "assigns the pharmacist as @pharmacist" do
        pharmacist = Pharmacist.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Pharmacist.any_instance.stub(:save).and_return(false)
        put :update, {:id => pharmacist.to_param, :pharmacist => { "first_name" => "invalid value" }}, valid_session
        assigns(:pharmacist).should eq(pharmacist)
      end

      it "re-renders the 'edit' template" do
        pharmacist = Pharmacist.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Pharmacist.any_instance.stub(:save).and_return(false)
        put :update, {:id => pharmacist.to_param, :pharmacist => { "first_name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested pharmacist" do
      pharmacist = Pharmacist.create! valid_attributes
      expect {
        delete :destroy, {:id => pharmacist.to_param}, valid_session
      }.to change(Pharmacist, :count).by(-1)
    end

    it "redirects to the pharmacists list" do
      pharmacist = Pharmacist.create! valid_attributes
      delete :destroy, {:id => pharmacist.to_param}, valid_session
      response.should redirect_to(pharmacists_url)
    end
  end

end