# -*- encoding : utf-8 -*-
require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  render_views
  subject { page }
  let(:group) { FactoryGirl.create(:group) }
  let(:user) { FactoryGirl.create(:user, group_id: group.id) }

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

  describe "renders the panel template" do
    before do
      logged_as(user)
      visit users_path
    end

    it { should render_template("panel") }
  end
end