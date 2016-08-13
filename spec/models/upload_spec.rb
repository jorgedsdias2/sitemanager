# -*- encoding : utf-8 -*-
require 'rails_helper'

RSpec.describe Upload, type: :model do
	before(:each) do
		@upload = FactoryGirl.build(:upload)
	end

	it "be a valid image" do
		@upload.image = File.new(Rails.root + "spec/support/images/wrong")
		expect(@upload).to be_invalid
	end

	it "not save upload without page id" do
		@upload.page_id = nil
		@upload.save
		expect(@upload.errors[:page_id].any?).to eq(true)
	end

	it "success upload image" do
		@upload.save
		expect(File.exists?(Rails.root + "public/images/original/#{@upload.page_id}/#{@upload.image_file_name}")).to eq(true)
	end	
end