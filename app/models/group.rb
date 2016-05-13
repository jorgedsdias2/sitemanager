# -*- encoding : utf-8 -*-
class Group < ActiveRecord::Base
	has_many :users
	validates :name, presence: true, uniqueness: true
end
