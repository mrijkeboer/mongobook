require 'bcrypt'

class User
	include MongoMapper::Document

	key :username, String
	key :password_hash, String

	validates_presence_of :username
	validates_length_of :username, :within => 3..250
	validates_uniqueness_of :username

	validate :valid_password

	after_save :clear_password


	def clear_password
		@password = nil
		@password_confirmation = nil
	end


	def username=(val)
		if self.username.to_s.length  == 0 or self.new_record?
			self[:username] = val.to_s.downcase
		end
	end


	def password
		return @password
	end


	def password=(val)
		if val.present?
			@password = val
			self.password_hash = BCrypt::Password.create(val)
		end
	end
	

	def password_confirmation
		return @confirmation
	end


	def password_confirmation=(val)
		@confirmation = val
	end


	def correct_password?(password)
		if password_hash == password
			return true
		else
			return false
		end
	end


	def User.sign_in(username, password)
		user = User.find_by_username(username.to_s.downcase)
		if user != nil
			if user.correct_password?(password) == false
				user = nil
			end
		end

		return user
	end


	def password_hash
		return BCrypt::Password.new(self[:password_hash])
	end


	def password_hash=(val)
		self[:password_hash] = val
	end


	private
	

	def valid_password
		if @password.to_s.length < 5
			errors.add(:password, "is too short (minimum is 5 characters)")
		elsif @password.to_s.length > 250
			errors.add(:password, "is too long (maximum is 250 characters)")
		end

		if @password.to_s != @confirmation.to_s
			errors.add(:password, "doesn't match confirmation")
		end
	end

end
