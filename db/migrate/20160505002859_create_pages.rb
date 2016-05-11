class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :summary
      t.text :description
      t.string :nickname
      t.string :link
      t.string :target
      t.integer :order

      t.timestamps null: false
      t.index :title, unique: true
      t.index :order, unique: true
    end
  end
end