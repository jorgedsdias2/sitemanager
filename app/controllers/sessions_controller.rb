class SessionsController < ApplicationController
	layout 'login'
	before_filter :require_user, only: [:index]
	before_filter :set_title, :only => [:new]

	def index
		render layout: 'painel'
	end

	def new
	end

	def create
		@user = User.find_by_email(params[:session][:email])
		respond_to do |format|
			if @user && @user.authenticate(params[:session][:password])
				session[:user_id] = @user.id
				format.html { redirect_to index_url }
			else
				flash[:notice] = "E-mail or Password is wrong"
				format.html { render 'new' }
			end
		end
	end

	def destroy
	end

	private
		def set_title
			@title = "Login"
		end
end