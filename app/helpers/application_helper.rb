# -*- encoding : utf-8 -*-
module ApplicationHelper

=begin
	def display_panel_links(title, new_model_url, models_path)
	  content_tag :li do
	    link_to "<i class='fa fa-group fa-fw'></i> #{title} <span class='fa arrow'></span>".html_safe, '#'
	    content_tag :ul, class: "nav nav-second-level" do
	      content_tag :li do
	        link_to "<i class='fa fa-edit fa-fw'></i> #{t('text.register_new')}".html_safe, new_model_url
	      end
	      content_tag :li do
	        link_to "<i class='fa fa-list fa-fw'></i> #{t('text.list_all')}".html_safe, models_path
	      end
	    end
	  end
	end
=end

end
