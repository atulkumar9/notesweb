class CreateNoteLabels < ActiveRecord::Migration
  def change
    create_table :note_labels do |t|
      t.integer :note_id
      t.integer :label_id
      t.string :summary
      t.timestamps null: false
  	end
  	add_index :note_labels, ["note_id", "label_id"]
	end
end
