class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer "user_id"
      t.string "title", :null => false
      t.text "text", :null => false, :limit => 3000
      t.timestamps null: false
    end
    add_index("notes", "user_id")
  end
end
