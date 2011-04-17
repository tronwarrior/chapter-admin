class User < ActiveRecord::Base


  acts_as_authentic do |c|
    c.login_field = :email
    c.ignore_blank_passwords = true
    c.validate_password_field = false
    c.require_password_confirmation = false
  end
end
