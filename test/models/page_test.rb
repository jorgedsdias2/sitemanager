require 'test_helper'

class PageTest < ActiveSupport::TestCase
	def setup
		@page = Page.new(
			title: 'Pagina',
			summary: 'pagina',
			description: 'pagina',
			nickname: 'pagina',
			link: 'http://www.pagina.com.br',
			target: '_blank',
			order: 3
		);
		@page_db = Page.find(1)
	end

	def teardown
		@page = nil
	end

	test "should be a valid page" do
		@page = Page.new
		assert !@page.valid?, "Page should't be created"
	end

	test "should not save page without title" do
		@page.title = nil
		save_assert_model @page, :title, "Save the page without a title"
	end

	test "should not save page if title exists" do
		@page.title = @page_db.title
		save_assert_model @page, :title, "Save the page if title exists"
	end

	test "should not save page if description has more than 255 characters" do
		@page.description = "1" * 255 + "1"
		save_assert_model @page, :description, "Save the page if description has more than 255 characters"
	end

	test "should not save page without order" do
		@page.order = nil
		save_assert_model @page, :order, "Save the page without order"
	end

	test "should not save page if order exists" do
		@page.order = @page_db.order
		save_assert_model @page, :order, "Save the page if order exists"
	end
end