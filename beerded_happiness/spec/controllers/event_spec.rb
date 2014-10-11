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

end