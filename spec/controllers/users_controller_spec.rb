# -*- encoding : utf-8 -*-
require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  render_views
  subject { page }
  let(:groups) { FactoryGirl.create(:groups, name: 'Administrator') }
  let(:user) { FactoryGirl.create(:user, group_id: group.id) }
  let(:new_user) { FactoryGirl.build(:user, name: 'Other User', email: 'other@email.com') }

  # GET index
  describe 'GET index' do
    describe 'list all users' do
      before do
        logged_as(user)
        visit users_path
      end

      it { should have_selector('.table tbody>tr', :minimum => 1) }
      #it { puts all('.table tbody>tr').count }
      #it { expect(assigns('users')).to eq([user]) }
    end
  end

  # GET new
  describe 'GET new' do
    describe 'new user' do
      before do
        logged_as(user)
        visit new_user_path
      end

      it { should have_text(t('text.user.register')) }
    end
  end

  # GET edit
  describe 'GET edit' do
    describe 'edit user' do
      before do
        logged_as(user)
        visit edit_user_path(user)
      end

      it { should have_text(t('text.user.update')) }
    end
  end

  # POST create
  describe 'POST create' do
    describe 'successful' do
      before do
        logged_as(user)
        create_new_user(new_user)
      end

      it { should have_selector('div.alert.alert-success', text: t('text.user.create_success')) }
    end

    describe 'unsuccessful' do
      before do
        logged_as(user)
        new_user.name = ''
        create_new_user(new_user)
      end

      it { should have_text(t('text.validations.dont_save_register')) }
    end
  end

  # POST update
  describe 'POST update' do
    describe 'successful' do
      before do
        logged_as(user)
        update_user(user)
      end

      it { should have_selector('div.alert.alert-success', text: t('text.user.update_success')) }
    end

    describe 'unsuccessful' do
      before do
        logged_as(user)
        user.name = ''
        update_user(user)
      end

      it { should have_text(t('text.validations.dont_save_register')) }
    end
  end

  # DELETE destroy
  describe 'DELETE destroy' do
    describe 'successful' do
      before do
        logged_as(user)
        create_new_user(new_user)
        first('a.remove').click
      end

      it { should have_selector('div.alert.alert-success', text: t('text.user.destroy_success')) }
    end
  end

  describe 'renders the panel template' do
    before do
      logged_as(user)
      visit users_path
    end

    it { should render_template('panel') }
  end
end
