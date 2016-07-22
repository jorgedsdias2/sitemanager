# -*- encoding : utf-8 -*-
class Page < ActiveRecord::Base
	belongs_to :user
	validates :title, presence: true, uniqueness: true
	validates :description, presence: true, length: { maximum: 255 }
	validates :order, presence: true, numericality: { only_integer: true }
	validates :status, presence: true
	validates :user_id, presence: true
end
