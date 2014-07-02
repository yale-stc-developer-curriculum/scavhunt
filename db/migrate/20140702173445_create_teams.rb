class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :start
      t.string :members

      t.timestamps
    end
  end
end
