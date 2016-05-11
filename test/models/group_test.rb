require 'test_helper'

class GroupTest < ActiveSupport::TestCase
	def setup
		@group = Group.new(
			name: 'Group'
		);
		@group_bd = Group.find(1)
	end

	def teardown
		@group = nil
	end

	test "should be a valid group" do
		@group = Group.new
		assert !@group.valid?, "Group should't be created"
	end
	
	test "shoud not save group without name" do
		@group.name = nil
		save_assert_model @group, :name, "Save the group without a name"
	end

	test "shoud not save group if name exists" do
		@group.name = @group_bd.name
		save_assert_model @group, :name, "Save the group if name exists"
	end
end