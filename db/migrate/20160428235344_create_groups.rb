# -*- encoding : utf-8 -*-
class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name

      t.timestamps null: false
      t.index :name, unique: true
    end
  end

  def down
    drop_table :groups
  end
end
