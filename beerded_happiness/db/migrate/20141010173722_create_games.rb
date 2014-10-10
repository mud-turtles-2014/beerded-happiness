class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
    t.string :status
    t.belongs_to :winner
    t.belongs_to :event

    t.timestamps
    end
  end
end
