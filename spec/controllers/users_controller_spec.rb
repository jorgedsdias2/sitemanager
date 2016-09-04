# -*- encoding : utf-8 -*-
require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	render_views
	subject{ page }
	let(:user) { FactoryGirl.create(:user) }

	# GET index
	describe "GET index" do
		describe "list all users" do
			before do
				logged_as(user)
				visit users_path
			end

			it { should have_selector('.table tbody>tr', :minimum => 1) }
			#it { puts all(".table tbody>tr").count }
			#it { expect(assigns('users')).to eq([user]) }
		end
	end

	describe "renders the panel template" do
		before do
			logged_as(user)
			visit users_path
		end

		it { should render_template("panel") }
	end
end