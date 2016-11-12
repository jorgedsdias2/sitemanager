# -*- encoding : utf-8 -*-
module UsersHelper
  def create_new_user(user)
    visit new_user_path
    fill_in 'user[name]', with: user.name
    fill_in 'user[email]', with: user.email
    select 'Administrador', from: 'user[group_id]'
    fill_in 'user[password]', with: user.password
    fill_in 'user[password_confirmation]', with: user.password
    click_button t('text.register')
  end
end