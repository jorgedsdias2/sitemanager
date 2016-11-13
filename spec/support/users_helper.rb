# -*- encoding : utf-8 -*-
module UsersHelper
  def create_new_user(user)
    visit new_user_path
    user_form(user)
  end

  def update_user(user)
    visit edit_user_path(user)
    user_form(user)
  end

  private
  def user_form(user)
    group = FactoryGirl.build(:groups, name: 'Administrator')
    fill_in 'user[name]', with: user.name
    fill_in 'user[email]', with: user.email
    select group.name, from: 'user[group_id]'
    fill_in 'user[password]', with: user.password
    fill_in 'user[password_confirmation]', with: user.password
    click_button t('text.register')
  end
end
