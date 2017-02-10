# -*- encoding : utf-8 -*-
require 'rails_helper'

RSpec.describe Page, type: :model do
	before(:each) do
		@page = FactoryGirl.build(:page)
	end

	let(:page_db) { FactoryGirl.create(:page, title: 'Other Page') }

	it "be a valid page" do
		@page = Page.new
		expect(@page).to be_invalid
	end

	it "not save page without title" do
		@page.title = nil
		@page.save
		expect(@page.errors[:title].any?).to eq(true)
	end

	it "not save page if title exists" do
		@page.title = page_db.title
		@page.save
		expect(@page.errors[:title].any?).to eq(true)
	end

	it "not save page without description" do
		@page.description = nil
		@page.save
		expect(@page.errors[:description].any?).to eq(true)
	end

	it "not save page if description has more than 255 characters" do
		@page.description = "1" * 255 + "1"
		@page.save
		expect(@page.errors[:description].any?).to eq(true)
		#@page.erros[:description].any?.should be_true
	end

	it "not save page if order is not integer" do
		@page.order = "anystring"
		@page.save
		expect(@page.errors[:order].any?).to eq(true)
	end

	it "not save page without status" do
		@page.status = nil
		@page.save
		expect(@page.errors[:status].any?).to eq(true)
	end

	it "belongs to user" do
		@page.user_id = nil
		@page.save
		expect(@page.errors[:user_id].any?).to eq(true)
	end
end
