# -*- encoding : utf-8 -*-
module GroupsHelper
  def create_new_group(group)
    visit new_group_path
    group_form(group)
    click_button t('text.register')
  end

  def update_group(group)
    visit edit_group_path(group)
    group_form(group)
    click_button t('text.update')
  end

  private
  def group_form(group)
    fill_in 'group[name]', with: group.name    
  end
end
