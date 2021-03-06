# -*- encoding : utf-8 -*-
class GroupsController < ApplicationController
  layout 'panel'
  before_action :require_user
  before_action :set_title
  before_action :set_group, only: [:edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:destroy]

  def index
    @groups = Group.order('id DESC').all
  end

  def new
    @group = Group.new
  end

  def edit
  end

  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to groups_url, notice: t('text.group.create_success'), alert: 'success' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to groups_url, notice: t('text.group.update_success'), alert: 'success' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url, notice: t('text.group.destroy_success'), alert: 'success' }
    end
  end

  private
  def set_title
    @title = t('activerecord.models.group.other')
  end

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name)
  end
end
