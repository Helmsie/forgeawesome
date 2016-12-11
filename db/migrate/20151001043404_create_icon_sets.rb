class CreateIconSets < ActiveRecord::Migration
  def change
    create_table :icon_sets do |t|
      t.belongs_to :user, null: false, index: true
      t.belongs_to :designer, null: false, index: true
      t.string :name, null: false
      t.string :slug, null: false
      t.integer :designed_for, null: false
      t.string :css_prefix, null: false
      t.string :icon_css_prefix, null: false
      t.string :website
      t.timestamps null: false
    end

    add_foreign_key :icon_sets, :users, on_delete: :cascade
    add_foreign_key :icon_sets, :designers, on_delete: :cascade

    add_index :icon_sets, [:user_id, :name], unique: true
    add_index :icon_sets, [:user_id, :slug], unique: true
  end
end
