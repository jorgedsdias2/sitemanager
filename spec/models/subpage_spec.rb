# -*- encoding : utf-8 -*-
require 'rails_helper'

RSpec.describe Subpage, type: :model do
	before(:each) do
		@subpage = FactoryGirl.build(:subpage)
	end

	let(:group_bd) { FactoryGirl.create(:group) }
	let(:user_bd) { FactoryGirl.create(:user, group_id: group_bd.id) }
	let(:page_db) { FactoryGirl.create(:page, title: 'Other Page', user_id: user_bd.id) }

	describe 'be a valid subpage' do
		before do
			@subpage = Subpage.new
		end

		it { expect(@subpage).to be_invalid }
	end

	describe 'not save subpage without title' do
		before do
			@subpage.title = nil
			@subpage.save
		end

		it { expect(@subpage.errors[:title].any?).to eq(true) }
	end

	describe 'not save page without description' do
		before do
			@subpage.description = nil
			@subpage.save
		end

		it { expect(@subpage.errors[:description].any?).to eq(true) }
	end

	describe 'not save subpage if description hos more than 255 characters' do
		before do
			@subpage.description = "1" * 255 + "1"
			@subpage.save
		end

		it{ expect(@subpage.errors[:description].any?).to eq(true) }
	end

	describe 'not save subpage if order is not integer' do
		before do
			@subpage.order = "anystring"
			@subpage.save
		end

		it{ expect(@subpage.errors[:order].any?).to eq(true) }
	end

	describe 'not save subpage without status' do
		before do
			@subpage.status = nil
			@subpage.save
		end

		it{ expect(@subpage.errors[:status].any?).to eq(true) }
	end

	describe 'belongs to user' do
		before do
			@subpage.user_id = nil
			@subpage.save
		end

		it{ expect(@subpage.errors[:user_id].any?).to eq(true) }
	end

	describe 'belongs to page' do
		before do
			@subpage.page_id = nil
			@subpage.save
		end

		it{ expect(@subpage.errors[:page_id].any?).to eq(true) }
	end

	describe 'dont delete subpage with image' do
		before do
			@subpage.user_id = user_bd.id
			@subpage.page_id = page_db.id
			@subpage.save
			@subpage.uploads.create(image: File.new(Rails.root + 'spec/support/images/rails.png'))
			@subpage.destroy
		end

		it{ expect(@subpage.errors[:upload].any?).to eq(true) }
	end
end
