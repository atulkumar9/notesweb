class CreateLabels < ActiveRecord::Migration
  def change
    create_table :labels do |t|
      t.string "name", :array => true
      t.timestamps null: false
    end
  end
end
