# -*- encoding : utf-8 -*-
require 'rails_helper'

RSpec.describe Upload, type: :model do
	before(:each) do
		@upload = FactoryGirl.build(:upload)
	end

	it 'be a valid image' do
		@upload.image = File.new(Rails.root + 'spec/support/images/wrong')
		expect(@upload).to be_invalid
	end

	it 'success upload image' do
		@upload.save
		expect(File.exists?(@upload.get_path('original'))).to eq(true)
	end

	it 'success delete upload' do
		@upload.save
		@upload.image.destroy
		expect(File.exists?(@upload.get_path('original'))).to eq(false)
	end
end
