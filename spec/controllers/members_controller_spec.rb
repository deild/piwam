require 'rails_helper'

describe MembersController do

  let(:current_member) { FactoryGirl.create(:member) }
  let(:valid_attributes) { { last_name: 'Doe', first_name: 'John', email: 'john@example.com', password: 'password' } }
  let(:invalid_attributes) { { last_name: 'Doe', first_name: nil } }
  let(:valid_session) { { member_id: current_member.id } }

  describe "GET index" do
    it "assigns all members as @members" do
      get :index, {}, valid_session
      expect(assigns(:members)).to eq([current_member])
    end

    it "redirects to the login page in not authenticated" do
      member = Member.create! valid_attributes
      get :index
      expect(response).to redirect_to(login_url)
    end

    it "redirects to the setup page if there is no members" do
      get :index
      expect(response).to redirect_to(setup_url)
    end
  end

  describe "GET show" do
    it "assigns the requested member as @member" do
      member = Member.create! valid_attributes
      get :show, {:id => member.to_param}, valid_session
      expect(assigns(:member)).to eq(member)
    end
  end

  describe "GET new" do
    it "assigns a new member as @member" do
      get :new, {}, valid_session
      expect(assigns(:member)).to be_a_new(Member)
    end
  end

  describe "GET edit" do
    it "assigns the requested member as @member" do
      member = Member.create! valid_attributes
      get :edit, {:id => member.to_param}, valid_session
      expect(assigns(:member)).to eq(member)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Member" do
        expect {
          post :create, {:member => valid_attributes}, valid_session
        }.to change(Member, :count).by(2) # the other one is the current_member
      end

      it "assigns a newly created member as @member" do
        post :create, {:member => valid_attributes}, valid_session
        expect(assigns(:member)).to be_a(Member)
        expect(assigns(:member)).to be_persisted
      end

      it "redirects to the created member" do
        post :create, {:member => valid_attributes}, valid_session
        expect(response).to redirect_to(Member.last)
      end

      it "saves the creator" do
        post :create, {:member => valid_attributes}, valid_session
        expect(assigns(:member).creator).to eq(current_member)
        expect(assigns(:member).updater).to be_nil
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved member as @member" do
        post :create, {:member => invalid_attributes}, valid_session
        expect(assigns(:member)).to be_a_new(Member)
      end

      it "re-renders the 'new' template" do
        post :create, {:member => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) { { first_name: 'Jane' } }

      it "updates the requested member" do
        member = Member.create! valid_attributes
        put :update, {:id => member.to_param, :member => new_attributes}, valid_session
        member.reload
        expect(member.first_name).to eq('Jane')
      end

      it "assigns the requested member as @member" do
        member = Member.create! valid_attributes
        put :update, {:id => member.to_param, :member => valid_attributes}, valid_session
        expect(assigns(:member)).to eq(member)
      end

      it "redirects to the members list" do
        member = Member.create! valid_attributes
        put :update, {:id => member.to_param, :member => valid_attributes}, valid_session
        expect(response).to redirect_to(members_url)
      end

      it "saves the updater" do
        member = Member.create! valid_attributes
        put :update, {:id => member.to_param, :member => valid_attributes}, valid_session
        expect(assigns(:member).updater).to eq(current_member)
      end
    end

    describe "with invalid params" do
      it "assigns the member as @member" do
        member = Member.create! valid_attributes
        put :update, {:id => member.to_param, :member => invalid_attributes}, valid_session
        expect(assigns(:member)).to eq(member)
      end

      it "re-renders the 'edit' template" do
        member = Member.create! valid_attributes
        put :update, {:id => member.to_param, :member => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested member" do
      member = Member.create! valid_attributes
      get :index, {}, valid_session
      expect {
        delete :destroy, {:id => member.to_param}, valid_session
      }.to change(Member, :count).by(-1)
    end

    it "redirects to the members list" do
      member = Member.create! valid_attributes
      delete :destroy, {:id => member.to_param}, valid_session
      expect(response).to redirect_to(members_url)
    end
  end

  describe "GET faces" do
    it "assigns all members as @members" do
      get :faces, {}, valid_session
      expect(assigns(:members)).to eq([current_member])
    end
  end

  describe "GET map" do
    it "assigns all members as @members" do
      get :map, {}, valid_session
      expect(assigns(:members)).to eq([])
    end
  end

end
