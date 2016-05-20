require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
	render_views
	subject { page }
	let(:user) { FactoryGirl.create(:user) }

	describe "GET index invalid current user" do
		before { visit login_path }
		it { should have_selector('div.alert.alert-warning', text: 'Not authorized') }
	end

	describe "GET login" do
		before { visit login_path }
		it { should have_title('My Site | Login') }
		it { should have_content('Administrative Panel') }
	end

	describe "POST login invalid information" do
		before do
			user.email = user.email.upcase
			login(user)
		end
		it { should have_selector('div.alert.alert-warning', text: 'E-mail or Password is wrong') }
	end

	describe "POST login successful" do
		before { login(user) }
		it { should have_content('Welcome! ' + user.name) }
	end
end