class CreateSubpages < ActiveRecord::Migration
  def change
    create_table :subpages do |t|
      t.string :title
      t.string :summary
      t.text :description
      t.string :nickname
      t.string :link
      t.string :target
      t.integer :order
      t.string :status
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :page, index: true, foreign_key: true

      t.timestamps null: false
    end
  end

  def down
    drop_table :subpages
  end
end