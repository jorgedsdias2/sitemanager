# https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md

FactoryGirl.define do
	factory :user do |u|
		u.name 'User'
		u.email 'user@email.com'
		u.password '123456'
		u.password_confirmation '123456'
		u.group_id 1
	end

	factory :group do |g|
		g.name 'Group'
	end
end