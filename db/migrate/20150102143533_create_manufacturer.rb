class CreateManufacturer < ActiveRecord::Migration
  def change
    create_table :manufacturers do |t|
      t.string :nation, null: false
      t.string :name, null: false
    end
    add_index :manufacturers, [:name], unique: true
  end
end
