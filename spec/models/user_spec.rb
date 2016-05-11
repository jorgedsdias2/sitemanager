require 'rails_helper'

describe User do
	before(:each) do
		@user = User.new(
			name: 'User',
			email: 'user@email.com',
			password: '123456',
			password_confirmation: '123456',
			group_id: 1
		);
		@user_bd = User.find(1)
		@group_admin = Group.find_by_name('Administrator')
		@group_editor = Group.find_by_name('Editor')
	end

	it "should be a valid user" do
		@user = User.new
		expect(@user).to be_invalid
	end

	it "should not save user without name" do
		@user.name = nil
		@user.save
		expect(@user.errors[:name].any?).to eq(true)
	end

	it "should not save user without email" do
		@user.email = nil
		@user.save
		expect(@user.errors[:email].any?).to eq(true)
	end

	it "should not save user with bad email" do
		@user.email = "bad@email"
		@user.save
		expect(@user.errors[:email].any?).to eq(true)
	end

	it "should not save user if email exists" do
		@user.email = @user_bd.email
		@user.save
		expect(@user.errors[:email].any?).to eq(true)
	end

	it "should not save user without password" do
		@user.password = nil
		@user.save
		expect(@user.errors[:password].any?).to eq(true)
	end

	it "should not save user with password confirmation no match" do
		@user.password_confirmation = "nomatch"
		@user.save
		expect(@user.errors[:password_confirmation].any?).to eq(true)
	end

	it "should not save user without group" do
		@user.group_id = nil
		@user.save
		expect(@user.errors[:group_id].any?).to eq(true)
	end

	it "should be editor" do
		@user.group_id = @group_editor.id
		@user.save
		expect(@user.editor?).to eq(true)
	end

	it "should be administrator" do
		@user.group_id = @group_admin.id
		@user.save
		expect(@user.administrator?).to eq(true)
	end
end