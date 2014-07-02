class CreateClues < ActiveRecord::Migration
  def change
    create_table :clues do |t|
      t.integer :number    # the clue's number (where in the order it lies)
      t.string :location   # where the clue is located
      t.text :body 	       # the text of the clue
      t.string :unlock_digest        # the hash they need to match to advance
      t.index(:location)
      t.timestamps
    end
  end
end
