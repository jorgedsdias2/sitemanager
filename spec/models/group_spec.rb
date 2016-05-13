# -*- encoding : utf-8 -*-
require 'rails_helper'

RSpec.describe Group, type: :model do
	before(:each) do
		@group = FactoryGirl.build(:group)
	end

	let(:group_bd) { FactoryGirl.create(:group, name: 'Other Name') }

	it "be a valid group" do
		@group = Group.new
		expect(@group).to be_invalid
	end
	
	it "not save group without name" do
		@group.name = nil
		@group.save
		expect(@group.errors[:name].any?).to eq(true)
	end

	it "not save group if name exists" do
		@group.name = group_bd.name
		@group.save
		expect(@group.errors[:name].any?).to eq(true)
	end

	it "have many users" do
		expect(@group).to respond_to(:users)
	end
end
