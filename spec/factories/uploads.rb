# -*- encoding : utf-8 -*-
FactoryGirl.define do
  factory :upload do |u|
    u.page_id 1
    u.image File.new(Rails.root + 'spec/support/images/rails.png')
  end
end
