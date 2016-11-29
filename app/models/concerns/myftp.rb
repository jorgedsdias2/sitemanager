# -*- encoding : utf-8 -*-
module Myftp
  extend ActiveSupport::Concern

  $use_ftp = false

  included do
  end

  module ClassMethods
    def use_ftp?
      return $use_ftp
    end

    def ftp_params(name)
      ftp_params = {
          :absolute_path => 'http://www.{my_site}.com.br',
          :path => '/{path}/images/:style/:id/:filename',
          :url => '/images/:style/:id/:filename',
          :host => '{host}',
          :user => '{user}',
          :password => '{password}',
          :port => 21,
          :passive => true
      }

      if self.use_ftp?
        return ftp_params[name]
      else
        return ''
      end
    end
  end
end

