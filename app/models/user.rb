# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  include UtilitieConcern

  belongs_to :group
  has_many :pages
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :group_id, presence: true

  after_initialize :set_user_role
  before_destroy :dont_delete_administrator

  def editor?
    self.group.name.downcase == 'editor'
  end

  def administrator?
    self.group.name.downcase == 'administrator'
  end

  private
  def set_user_role
    if self.role != 'administrator'
      self.role = 'user'
    end
  end

  def dont_delete_administrator
    if self.role == 'administrator'
      errors.add(:base, t('text.validations.dont_delete_administrator'))
      return false
    end
  end
end
