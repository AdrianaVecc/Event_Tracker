class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :name
      t.integer :guests, :default => 0
      t.integer :event_id

      t.timestamps
    end
  end
end
