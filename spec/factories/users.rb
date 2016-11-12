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
end


