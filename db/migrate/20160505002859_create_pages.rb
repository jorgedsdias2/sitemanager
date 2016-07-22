# -*- encoding : utf-8 -*-
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
      t.string :status
      t.belongs_to :user, index: true

      t.timestamps null: false
      t.index :title, unique: true
    end
  end

  def down
    drop_table :pages
  end
end
