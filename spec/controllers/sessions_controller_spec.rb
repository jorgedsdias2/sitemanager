require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
	describe "GET index" do
		it "renders the painel layout" do
			get :index
			expect(response).to render_template("painel")
		end

		# "Painel Administrativo"
		# "must contain welcome message"
	end

	describe "GET new" do
		it "renders the login layout" do
			get :new
			expect(response).to render_template("login")
		end

		it "must contain my site and title" do
			get :new
			title = assigns(:title)
			expect(response.body).to have_text("My Site | " + title)
		end
	end
end