# -*- encoding : utf-8 -*-
FactoryGirl.define do
	factory :page do |p|
		p.title 'Page'
		p.summary 'Page'
		p.description 'One Page'
		p.nickname 'page'
		p.link 'http://www.page.com.br'
		p.target '_self'
		p.order 1
		p.status 'A'
		p.user_id 1
	end
end
