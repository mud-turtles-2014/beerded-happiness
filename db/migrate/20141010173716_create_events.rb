class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :status
      t.belongs_to :creator

      t.timestamps
    end
  end
end
