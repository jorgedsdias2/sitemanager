# -*- encoding : utf-8 -*-
require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
	render_views
	subject { page }
	let(:user) { FactoryGirl.create(:user) }

	# GET index
	describe "GET index" do
		describe "valid current user" do
			before do
				logged_as(user)
				visit index_path
			end
			it { should have_content('Bem vindo! ' + user.name) }
		end

		describe "invalid current user" do
			before { visit index_path }
			it { should have_selector('div.alert.alert-warning', text: 'Not authorized') }
		end
	end

	# GET login
	describe "GET login" do
		describe "successful" do
			before { visit login_path }
			it { should have_title('Meu Site | Login') }
			it { should have_content('Administrative Panel') }
		end
	end

	# POST login
	describe "POST login" do
		describe "valid information" do
			before { login(user) }
			it { should have_link('Logout') }
		end

		describe "invalid information" do
			before do
				user.email = user.email.upcase
				login(user)
			end
			it { should have_selector('div.alert.alert-warning', text: 'E-mail ou Senha inválidos') }
		end
	end

	# DELETE logout
	describe "DELETE logout" do
		describe "successful" do
			before do
				logged_as(user)
				visit index_path
				click_link 'Logout'
			end
			it { should have_button('Login') }
		end
	end
end
