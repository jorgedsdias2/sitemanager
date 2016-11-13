# -*- encoding : utf-8 -*-
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.belongs_to :groups, index: true
      t.string :role

      t.timestamps null: false
      t.index :email, unique: true
    end
  end

  def down
    drop_table :users
  end
end
