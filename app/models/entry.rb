class Entry < ActiveRecord::Base
  # Would put these in a lib file if used by more than one model
  DOMAIN_HEAD_REGEX = '(?:[A-Z0-9\-]+\.)+'.freeze
  DOMAIN_TLD_REGEX  = '(?:[A-Z]{2}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|jobs|museum)'.freeze
  DOMAIN_REGEX      = "\\A#{DOMAIN_HEAD_REGEX}#{DOMAIN_TLD_REGEX}\\z"
  IP_REGEX          = "\\A([1-2]?[0-9]?[0-9]\.){3}[1-2]?[0-9]?[0-9]\\z"
  IP_DOMAIN_REGEX   = /#{DOMAIN_REGEX}|#{IP_REGEX}/i
  MAC_REGEX         = /\A([0-9A-F]{2}:){5}[0-9A-F]{2}\z/i
  
  validates_presence_of :username, :password, :domain, :protocol, :mac, :note
  validates_length_of   :username, :password, :domain, :protocol, :mac, :note, :maximum => 100
  validates_format_of   :mac,   :with => MAC_REGEX
  validates_format_of   :domain, :with => IP_DOMAIN_REGEX
  
  # Overwrite the password reader to protect it by default
  def password
    clear_pass = read_attribute(:password)
    clear_pass[0..2]+ "********" unless clear_pass.nil?
  end

  def clear_password
    clear_pass = read_attribute(:password)
  end
end
