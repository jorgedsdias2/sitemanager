# -*- encoding : utf-8 -*-
FactoryGirl.define do
  factory :upload do
  	id 1
    image File.new(Rails.root + 'spec/support/images/rails.png')
  end
end
