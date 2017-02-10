class CreateSubpagesUploads < ActiveRecord::Migration
  def change
    create_table :subpages_uploads, id: false do |t|
      t.belongs_to :subpage, index: true, foreign_key: true
      t.belongs_to :upload, index: true, foreign_key: true
    end
  end
end
