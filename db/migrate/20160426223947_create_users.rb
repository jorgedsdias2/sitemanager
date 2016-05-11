class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.belongs_to :group, index: true

      t.timestamps null: false
      t.index :email, unique: true
    end
  end

  def down
    drop_table :users
  end
end