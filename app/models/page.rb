# -*- encoding : utf-8 -*-
class Page < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :uploads
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true, length: {maximum: 255}
  validates :order, presence: true, numericality: {only_integer: true}
  validates :status, presence: true
  validates :user_id, presence: true

  before_destroy :dont_delete_page_with_image

  private
  def dont_delete_page_with_image
    if self.uploads.any?
      errors.add(:base, t('text.page.dont_delete_page_with_image'))
      return false
    end
  end
end
