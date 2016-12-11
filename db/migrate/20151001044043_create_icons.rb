class CreateIcons < ActiveRecord::Migration
  def change
    create_table :icons do |t|
      t.belongs_to :icon_set, null: false
      t.string :name, null: false
      t.integer :unicode, null: false
      t.text :svg, null: false
      t.timestamps null: false
    end

    add_foreign_key :icons, :icon_sets, on_delete: :cascade

    add_index :icons, [:icon_set_id, :name], unique: true
    add_index :icons, [:icon_set_id, :unicode], unique: true
  end
end
