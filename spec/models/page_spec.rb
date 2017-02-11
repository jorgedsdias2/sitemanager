# -*- encoding : utf-8 -*-
require 'rails_helper'

RSpec.describe Page, type: :model do
	before(:each) do
		@page = FactoryGirl.build(:page)
	end

	let(:user_bd) { FactoryGirl.create(:user, email: 'user1@email.com') }
	let(:page_db) { FactoryGirl.create(:page, title: 'Other Page', user_id: user_bd.id) }

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

	describe "dont delete page with image" do
		before do
			@page.user_id = user_bd.id
			@page.save
			@page.uploads.create(image: File.new(Rails.root + 'spec/support/images/rails.png'))
			@page.destroy
		end

		it{ expect(@page.errors[:upload].any?).to eq(true) }
	end	
end
