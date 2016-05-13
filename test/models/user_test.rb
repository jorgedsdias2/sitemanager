# -*- encoding : utf-8 -*-
require 'test_helper'

class UserTest < ActiveSupport::TestCase
	def setup
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

	def teardown
		@user = nil
	end

	test "should be a valid user" do
		@user = User.new
		assert !@user.valid?, "User should't be created"
	end

	test "should not save user without name" do
		@user.name = nil
		save_assert_model @user, :name, "Save the user without a name"
	end

	test "should not save user without email" do
		@user.email = nil
		save_assert_model @user, :email, "Save the user without a email"
	end

	test "should not save user with bad email" do
		@user.email = "bad@email"
		save_assert_model @user, :email, "Save the user with bad email"
	end

	test "should not save user if email exists" do
		@user.email = @user_bd.email
		save_assert_model @user, :email, "Save the user if email exists"
	end

	test "should not save user without password" do
		@user.password = nil
		save_assert_model @user, :password, "Save the user without a password"
	end

	test "should not save user with password confirmation no match" do
		@user.password_confirmation = "nomatch"
		save_assert_model @user, :password_confirmation, "Save the user with password confirmation no match"
	end

	test "should not save user without group" do
		@user.group_id = nil
		save_assert_model @user, :group_id, "Save the user without a group"
	end

	test "should be editor" do
		@user.group_id = @group_editor.id
		@user.save
		assert @user.editor?, "User is not editor"
	end

	test "should be administrator" do
		@user.group_id = @group_admin.id
		@user.save
		assert @user.administrator?, "User is not administrator"
	end
end
