# -*- encoding : utf-8 -*-
class Upload < ActiveRecord::Base
  include FtpConcern

  has_and_belongs_to_many :pages
  has_and_belongs_to_many :subpages

  if use_ftp?
    has_attached_file :image,
                      {
                          :storage => :ftp,
                          :path => ftp_params(:path),
                          :url => ftp_params(:url),
                          :ftp_servers => [
                              {
                                  :host => ftp_params(:host),
                                  :user => ftp_params(:user),
                                  :password => ftp_params(:password),
                                  :port => ftp_params(:port),
                                  :passive => ftp_params(:passive)
                              }
                          ],
                          :ftp_connect_timeout => 10000,
                          :ftp_ignore_failing_connections => true,
                          :ftp_keep_empty_directories => true,
                          styles: {thumb: '103x91>', medium: '300x160>'}
                      }
  else
    has_attached_file :image,
                      styles: {thumb: '103x91>', medium: '300x160>'},
                      :path => ':rails_root/public/images/:style/:id/:filename',
                      :url => '/images/:style/:id/:filename'
  end

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def get_path(style)
    Rails.root + "public/images/#{style}/#{id}/#{image_file_name}"
  end
end
