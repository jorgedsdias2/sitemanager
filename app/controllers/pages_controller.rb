class PagesController < ApplicationController
  layout 'panel'
  before_action :require_user
  before_action :set_title
  before_action :set_page, only: [:edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token

  def index
    @pages = Page.includes(:user).order('id DESC').all
  end

  def new
    @page = Page.new
  end

  def edit
    @uploads = @page.uploads.all
    @upload = Upload.new
    @absolute_path = Upload.ftp_params(:absolute_path)
  end

  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to pages_url, notice: t('text.page.create_success'), alert: 'success' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to pages_url, notice: t('text.page.update_success'), alert: 'success' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @page.destroy
        format.html { redirect_to pages_url, notice: t('text.page.destroy_success'), alert: 'success' }
      else
        format.html { redirect_to pages_url, notice: "Erro: #{@page.errors.full_messages.to_s}", alert: 'danger' }
      end
    end
  end

  private
  def set_title
    @title = t('activerecord.models.page.other')
  end

  def set_page
    @page = Page.find(params[:id])
  end

  def page_params
    params.require(:page).permit(:title, :summary, :description, :nickname, :link, :target, :order, :status, :user_id)
  end
end
