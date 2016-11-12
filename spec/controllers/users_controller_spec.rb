# -*- encoding : utf-8 -*-
require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  render_views
  subject { page }
  let(:group) { FactoryGirl.create(:group, name: 'Administrator') }
  let(:user) { FactoryGirl.create(:user, group_id: group.id) }
  let(:new_user) { FactoryGirl.build(:user, email: 'other@email.com.br') }

  # GET index
  describe "GET index" do
    describe "list all users" do
      before do
        logged_as(user)
        visit users_path
      end

      it { should have_selector('.table tbody>tr', :minimum => 1) }
      #it { puts all(".table tbody>tr").count }
      #it { expect(assigns('users')).to eq([user]) }
    end
  end

  # GET new
  describe "GET new" do
    describe "new user" do
      before do
        logged_as(user)
        visit new_user_path
      end

      it { should have_text(t('text.user.register')) }
    end
  end

  # GET edit
  describe "GET edit" do
    describe "edit user" do
      before do
        logged_as(user)
        visit edit_user_path(user)
      end

      it { should have_text(t('text.user.update')) }
    end
  end

  # POST create
  describe "POST create" do
    describe "successful" do
      before do
        logged_as(user)
        create_new_user(new_user)
      end

      it { should have_text(t('text.user.create_success')) }
    end

=begin
    describe "unsuccessful" do
      before do
        logged_as(user)
        visit users_path(user)
      end
    end
=end
  end

  describe "renders the panel template" do
    before do
      logged_as(user)
      visit users_path
    end

    it { should render_template("panel") }
  end
end