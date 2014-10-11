require 'rails_helper'
require 'spec_helper'

describe GamesController do
  let(:user) { User.create(name: "numichuu", password: "test", password_confirmation: "test", phone_number: "123-123-1234", email:"numichuu@gmail.com")}
  let(:new_event) { Event.create(title: "BeerFest", status: "Active", creator_id: user.id) }
  let(:new_game) { Game.create(status: "Active", winner_id: :user.id, event: :new_event) }

  # describe "#index" do
  #   it "renders the index template" do
  #     expect(get :index).to render_template (:index)
  #   end
  # end

  describe "#new" do
    it "renders the new game template" do
      expect(get :new).to render_template (:new)
    end

    it "renders form with new game" do
      get :new
      expect(assigns(:game)).to be_a_new Game
    end
  end

  #  describe "#create" do
  #   let!(:create_post) { post :create, :event => {title: "DBC BP", status: "Active", creator_id: user.id} }

  #   it "adds a new event to the database" do
  #     expect(Event.where(title: "DBC BP")).to exist
  #   end

  #   it "redirects events index page" do
  #     expect(create_post).to redirect_to events_path
  #   end
  # end

  # describe "#show" do 
# NoMethod error
  #   # expect(assigns(:game)).to eq :new_game 

# TODO: Can't get this to go red...
  #   it "renders show template" do
  #     expect(get :show, id: new_event.id).to render_template(:show)
  #   end
  # end

end