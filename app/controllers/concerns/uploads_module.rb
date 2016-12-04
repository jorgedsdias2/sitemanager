# -*- encoding : utf-8 -*-
module UploadsModule
  extend ActiveSupport::Concern

  included do
  end

  def return_upload(upload_params, image)
    case
      when upload_params[:page_id]
        model = Page.find(upload_params[:page_id])
      when upload_params[:subpage_id]
        #model = Subpage.find(upload_params[:subpage_id])
      when upload_params[:article_id]
        #model = Article.find(upload_params[:article_id])
    end

    model.uploads.create(image: image)
  end
end