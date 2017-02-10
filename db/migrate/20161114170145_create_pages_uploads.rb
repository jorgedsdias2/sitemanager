# -*- encoding : utf-8 -*-
class CreatePagesUploads < ActiveRecord::Migration
  def change
    create_table :pages_uploads, id: false do |t|
      t.belongs_to :page, index: true, foreign_key: true
      t.belongs_to :upload, index: true, foreign_key: true
    end
  end
end
