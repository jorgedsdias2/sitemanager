# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
	belongs_to :group
  	has_secure_password
	validates :name, presence: true
	validates :email, presence: true, uniqueness: true
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	validates :group_id, presence: true

	def editor?
		self.group.name.downcase == 'editor'
	end

	def administrator?
		self.group.name.downcase == 'administrator'
	end
end
