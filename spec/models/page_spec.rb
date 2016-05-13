require 'rails_helper'

RSpec.describe Page, type: :model do
	before(:each) do
		@page = FactoryGirl.build(:page)
	end

	let(:page_db) { FactoryGirl.create(:page, name: 'Other Page') }

	pending "be a valid page"
	pending "not save page without name"
	pending "not save page if title exists"
	pending "not save page without description"
	pending "not save page if description has more than 255 characters"
	pending "not save page if order is not integer"
	pending "belongs to user"
end