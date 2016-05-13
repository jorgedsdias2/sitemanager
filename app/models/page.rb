# -*- encoding : utf-8 -*-
class Page < ActiveRecord::Base
	validates :title, presence: true, uniqueness: true
	validates :description, length: { maximum: 255 }
	validates :order, presence: true, uniqueness: true
end
