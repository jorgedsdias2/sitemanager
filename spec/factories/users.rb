# -*- encoding : utf-8 -*-
FactoryGirl.define do
	factory :user do |u|
		u.id 1
		u.name 'User'
		u.email 'user@email.com'
		u.password '123456'
		u.password_confirmation '123456'
		u.group_id 1
		u.role 'user'
  end

  factory :other_user do |u|
    u.id 2
    u.name 'Other User'
    u.email 'other@email.com'
    u.password '123456'
    u.password_confirmation '123456'
    u.group_id 1
    u.role 'user'
  end
end


