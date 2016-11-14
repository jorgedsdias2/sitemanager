# -*- encoding : utf-8 -*-
class CreatePagesAndUploads < ActiveRecord::Migration
  def change
    create_table :pages_uploads, id: false do |t|
      t.belongs_to :page, index: true
      t.belongs_to :upload, index: true
    end
  end
end