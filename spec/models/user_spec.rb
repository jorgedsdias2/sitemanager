# -*- encoding : utf-8 -*-
require 'rails_helper'

RSpec.describe User, type: :model do
	before(:each) do
		@user = FactoryGirl.build(:user)
	end

	let(:group_bd) { FactoryGirl.create(:group) }
	let(:user_bd) { FactoryGirl.create(:user, group_id: group_bd.id) }
	let(:group_admin) { FactoryGirl.create(:group, name: 'Administrator') }
	let(:group_editor) { FactoryGirl.create(:group, name: 'Editor') }

	describe 'be a valid user' do
		before do
			@user = User.new
		end

		it { expect(@user).to be_invalid }
	end

	describe 'not save user without name' do
		before do
			@user.name = nil
			@user.save
		end

		it { expect(@user.errors[:name].any?).to eq(true) }
	end

	describe 'not save user without email' do
		before do
			@user.email = nil
			@user.save
		end

		it { expect(@user.errors[:email].any?).to eq(true) }
	end

	describe 'not save user with bad email' do
		before do
			@user.email = 'bad@email'
			@user.save
		end

		it { expect(@user.errors[:email].any?).to eq(true) }
	end

	describe 'not save user if email exists' do
		before do
			@user.email = user_bd.email
			@user.save
		end

		it { expect(@user.errors[:email].any?).to eq(true) }
	end

	describe 'not save user without password' do
		before do
			@user.password = nil
			@user.save
		end

		it { expect(@user.errors[:password].any?).to eq(true) }
	end

	describe 'not save user with password confirmation no match' do
		before do
			@user.password_confirmation = 'nomatch'
			@user.save
		end

		it { expect(@user.errors[:password_confirmation].any?).to eq(true) }
	end

	describe 'be editor' do
		before do
			@user.group_id = group_editor.id
			@user.save
		end

		it { expect(@user.editor?).to eq(true) }
	end

	describe 'be administrator' do
		before do
			@user.group_id = group_admin.id
			@user.save
		end

		it { expect(@user.administrator?).to eq(true) }
	end

	describe 'belongs to group' do
		before do
			@user.group_id = nil
			@user.save
		end

		it { expect(@user.errors[:group_id].any?).to eq(true) }
	end

	describe 'have many pages' do
		it { expect(@user).to respond_to(:pages) }
	end

	describe 'be user role' do
		before do
			@user = User.new
		end

		it { expect(@user.role).to eq('user') }
	end

	describe 'dont"t delete administrator' do
		before do
			@user.role = 'administrator'
		end
		
		it { expect(@user.destroy).to eq(false) }
	end
end


