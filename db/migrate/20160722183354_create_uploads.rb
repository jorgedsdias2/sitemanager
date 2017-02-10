# -*- encoding : utf-8 -*-
class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.timestamps null: false
    end
  end
end
