require 'securerandom'
require_relative '../../config/database'
require_relative '../../config/environment'

class Url < ActiveRecord::Base
  # Remember to create a migration!
  def shorten
  	short_url = SecureRandom.base64(5)
  	self.short_url = short_url if self.short_url.nil?	
  end
end
