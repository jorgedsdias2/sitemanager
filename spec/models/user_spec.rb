# -*- encoding : utf-8 -*-
require 'rails_helper'

RSpec.describe User, type: :model do
	before(:each) do
		@user = FactoryGirl.build(:user)
	end

	let(:user_bd) { FactoryGirl.create(:user, email: 'user1@email.com') }
	let(:group_admin) { FactoryGirl.create(:group, name: 'Administrator') }
	let(:group_editor) { FactoryGirl.create(:group, name: 'Editor') }

	it "be a valid user" do
		@user = User.new
		expect(@user).to be_invalid
	end

	it "not save user without name" do
		@user.name = nil
		@user.save
		expect(@user.errors[:name].any?).to eq(true)
	end

	it "not save user without email" do
		@user.email = nil
		@user.save
		expect(@user.errors[:email].any?).to eq(true)
	end

	it "not save user with bad email" do
		@user.email = "bad@email"
		@user.save
		expect(@user.errors[:email].any?).to eq(true)
	end

	it "not save user if email exists" do
		@user.email = user_bd.email
		@user.save
		expect(@user.errors[:email].any?).to eq(true)
	end

	it "not save user without password" do
		@user.password = nil
		@user.save
		expect(@user.errors[:password].any?).to eq(true)
	end

	it "not save user with password confirmation no match" do
		@user.password_confirmation = "nomatch"
		@user.save
		expect(@user.errors[:password_confirmation].any?).to eq(true)
	end

	it "not save user without group" do
		@user.group_id = nil
		@user.save
		expect(@user.errors[:group_id].any?).to eq(true)
	end

	it "be editor" do
		@user.group_id = group_editor.id
		@user.save
		expect(@user.editor?).to eq(true)
	end

	it "be administrator" do
		@user.group_id = group_admin.id
		@user.save
		expect(@user.administrator?).to eq(true)
	end
end
