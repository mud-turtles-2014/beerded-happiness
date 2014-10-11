require 'rails_helper'
require 'spec_helper'

describe EventsController do

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
    it "adds a new event to the database" do
      post :create, event: {title: "DBC BP", status: "Active", creator_id: user.id}
      expect(Event.where(title: "DBC BP")).to exist
    end

    it "redirects events index page" do
      post :create, event: {title: "BeerPong Fest", status: "Active", creator_id: user.id}
      response.should redirect_to events_path
    end

    # it "renders form with new event" do
    #   get :new
    #   expect(assigns(:event)).to be_a_new Event
    # end
  end

end