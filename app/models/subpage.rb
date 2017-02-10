class Subpage < ActiveRecord::Base
  belongs_to :user
  belongs_to :page
  has_and_belongs_to_many :uploads
  validates :title, presence: true
  validates :description, presence: true, length: {maximum: 255}
  validates :order, presence: true, numericality: {only_integer: true}
  validates :status, presence: true
  validates :user_id, presence: true
  validates :page_id, presence: true

  private
  def dont_delete_subpage_with_image
  	if self.uploads.any?
  		errors.add(:upload, t('text.page.dont_delete_subpage_with_image'))
  		return false
  	end
  end
end