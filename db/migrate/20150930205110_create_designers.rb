class CreateDesigners < ActiveRecord::Migration
  def change
    create_table :designers do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :website
      t.timestamps null: false
    end

    add_index :designers, :email, unique: true
  end
end
