# -*- encoding : utf-8 -*-
FactoryGirl.define do
	factory :page do
		title 'MyString'
		summary 'MyString'
		description 'MyText'
		nickname 'MyString'
		link 'MyString'
		target 'MyString'
		order 1
		status 'A'
		user nil
	end
end
