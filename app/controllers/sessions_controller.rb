class SessionsController < ApplicationController
	layout 'login'
	before_filter :set_title, :only => [:new]

	def index
		render layout: 'painel'
	end

	def new
	end

	private
		def set_title
			@title = "Login"
		end
end