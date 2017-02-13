# -*- encoding : utf-8 -*-
FactoryGirl.define do
  factory :user do
    name 'User'
    email 'user@email.com'
    password '123456'
    password_confirmation '123456'
    role 'user'
    group nil
  end
end

