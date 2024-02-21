class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string "name", :null => false, :limit => 100
      t.string "password", :null => false
      t.string "username" , :null => false
      t.timestamps null: false
    end
    add_index("users", "username") # unique foriegn key.
  end 
end
