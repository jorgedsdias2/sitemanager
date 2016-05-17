require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
	render_views
	
=begin
	describe "GET index" do
		# "when user logged in"
		# "when user not logged in"
		it "renders the painel layout" do
			get :index
			expect(response).to render_template("painel")
		end

		# "Painel Administrativo"
		# "must contain welcome message"
	end
=end

	describe "GET new" do
		it "renders the login layout" do
			get :new
			expect(response).to render_template("login")
		end

		it "must contain my site and title" do
			get :new
			title = assigns(:title)
			expect(response.body).to have_title("My Site | " + title)
		end
	end
end