# -*- encoding : utf-8 -*-
module UsersHelper
  def create_new_user(user)
    visit new_user_path
    user_form(user)
    click_button t('text.register')
  end

  def update_user(user)
    visit edit_user_path(user)
    user_form(user)
    click_button t('text.update')
  end

  private
  def user_form(user)
    group = FactoryGirl.build(:group, name: 'Administrator')
    fill_in 'user[name]', with: user.name
    fill_in 'user[email]', with: user.email
    select group.name, from: 'user[group_id]'
    fill_in 'user[password]', with: user.password
    fill_in 'user[password_confirmation]', with: user.password    
  end
end

