class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
	t.integer :number
	t.belongs_to :team
      t.timestamps
    end
  end
end
