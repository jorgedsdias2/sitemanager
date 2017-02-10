# -*- encoding : utf-8 -*-
module UtilitieConcern
	def t(string, options={})
		I18n.t(string, options)
	end
end

