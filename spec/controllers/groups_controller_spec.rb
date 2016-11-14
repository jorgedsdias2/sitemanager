# -*- encoding : utf-8 -*-
require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  render_views
  subject { page }
  let(:group) { FactoryGirl.create(:group, name: 'Administrator') }
  let(:user) { FactoryGirl.create(:user, group_id: group.id) }
  let(:new_group) { FactoryGirl.build(:group, id: nil, name: 'Other Group') }

  # GET index
  describe 'GET index' do
    describe 'list all groups' do
      before do
        logged_as(user)
        visit groups_path
      end

      it { should have_selector('.table tbody>tr', :minimum => 1) }
    end
  end

  # GET new
  describe 'GET new' do
    describe 'new group' do
      before do
        logged_as(user)
        visit new_group_path
      end

      it { should have_text(t('text.group.register')) }
    end
  end

  # GET edit
  describe 'GET edit' do
    describe 'edit group' do
      before do
        logged_as(user)
        visit edit_group_path(user)
      end

      it { should have_text(t('text.group.update')) }
    end
  end

  # POST create
  describe 'POST create' do
    describe 'successful' do
      before do
        logged_as(user)
        create_new_group(new_group)
      end

      it { should have_selector('div.alert.alert-success', text: t('text.group.create_success')) }
    end

    describe 'unsuccessful' do
      before do
        logged_as(user)
        new_group.name = ''
        create_new_group(new_group)
      end

      it { should have_text(t('text.validations.dont_save_register')) }
    end
  end

  # POST update
  describe 'POST update' do
    describe 'successful' do
      before do
        logged_as(user)
        update_group(group)
      end

      it { should have_selector('div.alert.alert-success', text: t('text.group.update_success')) }
    end

    describe 'unsuccessful' do
      before do
        logged_as(user)
        group.name = ''
        update_group(group)
      end

      it { should have_text(t('text.validations.dont_save_register')) }
    end
  end

  # DELETE destroy
  describe 'DELETE destroy' do
    describe 'successful' do
      before do
        logged_as(user)
        create_new_group(new_group)
        first('a.remove').click
      end

      it { should have_selector('div.alert.alert-success', text: t('text.group.destroy_success')) }
    end
  end

  describe 'renders the panel template' do
    before do
      logged_as(user)
      visit groups_path
    end

    it { should render_template('panel') }
  end
end
