class Entry < ActiveRecord::Base
  validates_presence_of :username, :password, :domain, :protocol, :mac, :note

  # Overwrite the password reader to protect it by default
  def password
    clear_pass = read_attribute(:password)
    clear_pass[0..2]+ "********"
  end

  def clear_password
    clear_pass = read_attribute(:password)
  end
end
