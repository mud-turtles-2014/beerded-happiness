require 'rails_helper'
require 'spec_helper'

describe EventsController do
  let(:user) { User.create(name: "numichuu", password: "test", password_confirmation: "test", phone_number: "123-123-1234", email:"numichuu@gmail.com")}
  let(:new_event) { Event.create(title: "BeerFest", status: "Active", creator_id: user.id) }

  describe "#index" do
    it "renders the index template" do
      expect(get :index).to render_template (:index)
    end
  end

  describe "#new" do
    it "renders the new event template" do
      expect(get :new).to render_template (:new)
    end

    it "renders form with new event" do
      get :new
      expect(assigns(:event)).to be_a_new Event
    end
  end

   describe "#create" do
    let!(:create_post) { post :create, :event => {title: "DBC BP", status: "Active", creator_id: user.id} }

    it "adds a new event to the database" do
      expect(Event.where(title: "DBC BP")).to exist
    end

    it "redirects events index page" do
      expect(create_post).to redirect_to events_path
    end
  end

  describe "#show" do
    it "renders show template" do
      expect(get :show, id: new_event.id).to render_template(:show)
    end
  end

  describe "edit" do
    it "assigns the chosen event" do
      get :edit, id: new_event.id
      expect(assigns(:event)).to eq new_event
    end
  end

  describe "update" do
    it "updates the event's attributes" do
      new_title = "BP EXTRAVAGANZA"
      patch :update, id: new_event.id, event: {title: new_title}
      new_event.reload
      expect(new_event.title).to eq new_title
    end
  end

  describe "destroy" do
    before do
      new_event
    end

    let(:delete_event) {delete :destroy, id: new_event.id}

    it "removes particular event from database" do
        expect{
        delete :destroy, id: new_event.id
        }.to change(Event,:count).by(-1)
    end

    it "redirects to the events page" do
      expect(delete_event).to redirect_to events_path
    end
  end



end