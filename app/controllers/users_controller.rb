# -*- encoding : utf-8 -*-
class UsersController < ApplicationController
  layout 'panel'
  before_action :require_user
  before_action :set_title
  before_action :set_user, only: [:edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, only: [:destroy]

  def index
    @users = User.order('id DESC').all
  end

  def new
    @user = User.new
    render_view :new
  end

  def edit
    render_view :edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_url, notice: t('text.user.create_success'), alert: 'success' }
      else
        format.html { render_view :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_url, notice: t('text.user.update_success'), alert: 'success' }
      else
        format.html { render_view :edit }
      end
    end
  end

  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: t('text.user.destroy_success'), alert: 'success' }
    end
  end

  private
  def set_title
    @title = t('activerecord.models.user.other')
  end

  def set_user
    @user = User.find(params[:id])
  end

  def render_view(view)
    @groups = Group.order('id DESC').all
    render view
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :email, :group_id)
  end
end