# -*- encoding : utf-8 -*-
class UploadsController < ApplicationController
  include UploadsConcern

  layout 'panel'
  before_action :require_user
  before_action :set_title
  before_action :set_upload, only: [:destroy]
  skip_before_filter :verify_authenticity_token, only: [:create, :destroy]

  def create
    success = false
    error = nil

    if upload_params[:images]
      upload_params[:images].each do |image|
        @upload = self.return_upload(upload_params, image)

        if @upload.save
          success = true
        else
          success = false
          error = @upload.errors.full_messages.to_s
        end
      end
    end

    respond_to do |format|
      if success
        format.json { render :json => { success: t('text.upload.create_success'), status: :created } }
      else
        format.json { render :json => { error: "#{t('text.error')}: #{error}", status: :unprocessable_entity } }
      end
    end
  end

  def destroy
    @upload.image.destroy

    respond_to do |format|
      if @upload.destroy
        format.json { render :json => { success: t('text.upload.destroy_success'), status: :created } }
      else
        format.json { render :json => { error: "#{t('text.error')}: #{@upload.errors.full_messages.to_s}", status: :unprocessable_entity } }
      end
    end
  end

  private
  def set_title
    @title = t('activerecord.models.upload.other')
  end

  def set_upload
    @upload = Upload.find(params[:id])
  end

  def upload_params
    params.require(:upload).permit(:page_id, :subpage_id, {images: []})
  end
end
