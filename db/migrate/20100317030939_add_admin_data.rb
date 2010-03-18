class AddAdminData < ActiveRecord::Migration
  def self.up
    admin = User.new
    first_attempt = true
    while(!admin.save)
      puts admin.errors.to_xml unless first_attempt
      first_attempt = false
      puts "\nEnter your username: "
      login = STDIN.gets.chomp
      puts "\nEnter your email: "
      email = STDIN.gets.chomp
      puts "\nEnter your password: "
      password = STDIN.gets.chomp
      puts "\nConfirm your password: "
      password_confirmation = STDIN.gets.chomp
      admin.login = login
      admin.email = email
      admin.password = password
      admin.password_confirmation = password_confirmation
    end
  end

  def self.down
    User.all.each {|u| u.destroy}
  end
end
